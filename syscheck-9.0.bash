#!/bin/bash
#cd /home/chris

NOWDAT=$(date +"%y-%m-%d")
NOWTIM=$(date +"%T")
nvidia-smi > nvidia-smi.$NOWDAT.$NOWTIM
systemctl status mining.service > check.$NOWDAT.$NOWTIM

string=375.66"
#string1="Stopping"

FILE=nvidia-smi.$NOWDAT.$NOWTIM
FILE1=check.$NOWDAT.$NOWTIM
#FILE2=check.$NOWDAT.$NOWTIM

if grep -q $string "$FILE" ; then
# if it exist
        mv $FILE /home/chris/log/$FILE.OK
        rm $FILE1
	echo "nvidia-smi No. $string ..... OK"
else
#if not exist
        mv $FILE /home/chris/log/$FILE.NOK
        mv $FILE1 /home/chris/log/$FILE1.NOK
        /sbin/shutdown -r now
fi
