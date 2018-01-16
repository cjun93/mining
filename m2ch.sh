#!/bin/bash
clear

ls -l *.bash
echo 'Please type the mining method script...(e.g., *.bash)'

read -e -p " File Name : " filename


echo Delete the symbolic link
rm mining.sh
echo DONE

echo Make a symbolic link file.....
ln -s $filename mining.sh

sudo systemctl stop mining.service
sudo systemctl daemon-reload
sudo systemctl start mining.service

echo DONE
watch -n 0.5 systemctl status mining.service -n30
