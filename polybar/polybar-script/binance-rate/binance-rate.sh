#!/bin/bash
scriptDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $scriptDir

rateFile="$scriptDir/rate.txt"

prevRate=$(cat $rateFile)
if [ prev == "" ]; then
  ./rate-watcher > $rateFile
  cat $rateFile
  exit 0
fi 


./rate-watcher > $rateFile
currRate=$(cat $rateFile)


if (( $(echo "$currRate < $prevRate" | bc -l) )); then
  echo -e "%{F#c7486c}$currRate%{F-}"
elif (( $(echo "$currRate > $prevRate" | bc -l) )); then
  echo -e "%{F#419c47}$currRate%{F-}"
else (( $(echo "$currRate == $prevRate" | bc -l) ));
  echo "$currRate"
fi

