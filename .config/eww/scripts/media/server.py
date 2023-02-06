import os
import threading
import logging
import argparse
import socket
from time import sleep
import gi
gi.require_version('Playerctl', '2.0')  # noqa: E402
from gi.repository import Playerctl, GLib
import eww

manager = None
fav_index = 0


def parse_args(argv):
  parser = argparse.ArgumentParser()
  subparsers = parser.add_subparsers()
  parser_fav = subparsers.add_parser('fav')
  parser_fav.add_argument('key')
  parser_fav.set_defaults(func=fav)
  parser_p = subparsers.add_parser('p')
  parser_p.add_argument('key', type=int)
  parser_p.set_defaults(func=p)
  return parser.parse_args(argv)

def fav(args):
  global fav_index
  players = manager.props.players
  if args.key=='up':
    fav_index += 1
  elif args.key=='down':
    fav_index -= 1
  else:
    fav_index = int(args.key)
  fav_index %= len(players)
  logging.info(f'setting favorite to {fav_index} (input: {args.key})')
  manager.move_player_to_top(players[fav_index])
  fav_index = fav_index - 1 % len(players)
  eww.update(manager)

def p(args):
  key = args.key % len(manager.props.players)
  manager.props.players[key].play_pause()


def instance(player): return player.props.player_instance


def on_status(player, status, manager):
  on_metadata(player, player.props.metadata, manager)


def on_metadata(player, metadata, manager):
  logging.info(f'updating metadata for {instance(player)}')
  eww.update(manager)


def on_player_vanished(manager, player):
  logging.info(f'{instance(player)} vanished')
  eww.update(manager)


def init_player(manager, name):
  logging.info(f'initializing {name.instance}')
  player = Playerctl.Player.new_from_name(name)
  player.connect('playback-status', on_status, manager)
  player.connect('metadata', on_metadata, manager)
  manager.manage_player(player)
  on_metadata(player, player.props.metadata, manager)
  eww.update(manager)


def player_manager():
  global manager
  loop = GLib.MainLoop()

  logging.info(f'setting up player manager')
  manager = Playerctl.PlayerManager()
  manager.connect('name-appeared', init_player)
  manager.connect('player-vanished', on_player_vanished)

  for name in manager.props.player_names:
    init_player(manager, name)

  loop.run()


def server(adress):
  global manager
  logging.info(f'Starting socket at {adress}')
  try:
    os.unlink(adress)
  except OSError:
    if os.path.exists(adress):
      raise

  sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
  sock.bind(adress)
  sock.listen(1)
  while True:
    connection, _ = sock.accept()
    try:
      data = ''
      while chunk := connection.recv(16).decode('utf-8'):
        data += chunk
      argv = data.split(' ')
      args = parse_args(argv)
      args.func(args)
    except (Exception, SystemExit) as e:
      logging.debug(e)
    finally:
      connection.close()



def start(adress):
  threads = [
      threading.Thread(target=server, args=(adress,)),
      threading.Thread(target=player_manager)
  ]
  for t in threads:
    t.start()
  for t in threads:
    t.join()
