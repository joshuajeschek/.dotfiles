import socket
import logging
import sys
import server
ADRESS = '/tmp/eww/media/sock'

def client(argv):
  with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as sock:
    sock.connect(ADRESS)
    sock.sendall(bytearray(' '.join(argv), 'utf-8'))


def main():
  if len(sys.argv) > 1:
    server.parse_args(sys.argv[1:])
    client(sys.argv[1:])
  else:
    server.start(ADRESS)


if __name__ == '__main__':
  logging.basicConfig(
      format='%(asctime)s - %(levelname)s: %(message)s', level=logging.DEBUG)
  main()
