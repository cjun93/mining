#!/bin/bash
uid=magismine
while :
do
~/tools/xmr-stak/build/bin/xmr-stak --noCPU --currency monero -o asia.cryptonight-hub.miningpoolhub.com:20580 -u $uid.$(uname -n) -p x
sleep 1
done
