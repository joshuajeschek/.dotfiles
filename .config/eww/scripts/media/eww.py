import os
import json
import logging

def get_metadata(player):
  metadata = player.props.metadata
  return {
      'playing': player.props.status == 'Playing',
      'title': player.get_title() or False,
      'artist': player.get_artist() or False,
      'album': player.get_album() or False,
      'art': metadata['mpris:artUrl'] if 'mpris:artUrl' in metadata.keys() else False,
  }

def update(manager):
  media = []
  for player in manager.props.players:
    media.append(get_metadata(player))
  _update('media', media)



def _update(key, value):
  payload = json.dumps(value).replace('"', '\\\"')
  os.system(' '.join(['eww', 'update', f'{key}="{payload}"']))
