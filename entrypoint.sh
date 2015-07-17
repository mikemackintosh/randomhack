#!/bin/bash
set -e
mkdir -p /dev/net
chmod 600 /dev/net/tun

nohup openvpn --config /etc/openvpn/client.conf --remote $(sort --random-sort /etc/openvpn/remotes | grep -vE '^$' | head -n 1 ) &
sleep 1

/opt/nikto/program/nikto.pl -h "$@"
