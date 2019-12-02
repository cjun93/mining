#!/bin/bash
cd /home/chris/Tools/
while :
do
./xmrig --url=asia.randomx-hub.miningpoolhub.com:20580 --coin=monero --tls --donate-level=0 --userpass=magismine.$(uname -n):x --keepalive --no-cpu --cuda --cuda-loader=/home/chris/Tools/xmrig-cuda/build/libxmrig-cuda.so
sleep 30
done
