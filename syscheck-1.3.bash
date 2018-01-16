#!/bin/bash
## ================================================
##  Version 1.3 
##  1. Add if time is 00:00:00, diff_min > 30, fix it 

lettermonthchg(){
	case $1 in
		Jan)
		echo 1;;
		Feb)
		echo 2;;
		Mar)
		echo 3;;
		Apr)
		echo 4;;
		May)
		echo 5;;
		Jun)
		echo 6;;
		Jul)
		echo 7;;
		Aug)
		echo 8;;
		Sep)
		echo 9;;
		Oct)
		echo 10;;
		Nov)
		echo 11;;
		Dec)
		echo 12;;		
 		*)
		echo "Otherwise";;
esac
}

dmin=30

NOWDAT=$(date +"%y-%m-%d")
NOWTIM=$(date +"%T")

systemctl status mining.service  > check.$NOWDAT.$NOWTIM
nvidia-smi > nvidia-smi.$NOWDAT.$NOWTIM

##
## ================================================

tail -1 check.$NOWDAT.$NOWTIM > test_last.txt
begintime1=`awk '{print $3}' test_last.txt`
beginmonth1=`awk '{print $1}' test_last.txt`
beginday=`awk '{print $2}' test_last.txt`

rm test_last.txt

beginmonth=`lettermonthchg $beginmonth1`
begintime=2017-$beginmonth-$beginday\ $begintime1


lasttime=`date +%Y-%m-%d\ %H:%M:%S`
first_time=`date -d "$begintime" "+%s"`
second_time=`date -d "$lasttime" "+%s"` 

#echo $first_time
#echo $second_time

FILE=nvidia-smi.$NOWDAT.$NOWTIM
FILE1=check.$NOWDAT.$NOWTIM

diff=$((second_time-first_time))
diff_min=$((diff/60))

#echo $diff
#echo $diff_min

if [ $diff_min -lt 0 ]
	then
		diff_min=$(( -1*$diff_min ))
	else
		diff_min=$(( diff_min ))
fi
	

# echo $diff_min

if [ $diff_min -lt $dmin ]
then
	echo "systemctl status mining.service ..... OK"
	mv $FILE /home/chris/log/$FILE.OK
        rm $FILE1
else
	echo "NOK"
        mv $FILE /home/chris/log/$FILE.NOK
        mv $FILE1 /home/chris/log/$FILE1.NOK
        /sbin/shutdown -r now
fi
