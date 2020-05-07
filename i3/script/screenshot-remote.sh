#!/bin/bash

fileDate=`date +%Y-%m-%d-%H-%M-%S`
machineName=`hostname`
fileName=".png"
FILENAME=$fileDate"-"$machineName$fileName
SHORT=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 7 | head -n 1)
FILENAMESHORT=$SHORT$fileName
dst="pepsik.xyz" #your dst. server
dstPath="html"
dstAbs="/var/www/pepsik.xyz/"
user="root"

import $FILENAMESHORT
scp -C $FILENAMESHORT $user@$dst:$dstAbs$dstPath #send screenshot through SCP(with compression enabled for low-bandwith connection) 

echo "http://pepsik.xyz/"$FILENAMESHORT | xclip -i -selection clipboard #copy screenshot link to your clipboard

rm $FILENAMESHORT #delete screenshot locally
