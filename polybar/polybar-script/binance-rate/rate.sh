#!/bin/bash

scriptDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $scriptDir

export LC_NUMERIC="en_US.UTF-8"

riceColor="#419c47"
dropColor="#c7486c"
ratesDirectory="$scriptDir/rates"

COIN_SYMBOLS=(
  "BTC/USDT.2"
  "ETH/USDT.2"
  "BNB/USDT.2"
  "TRX/USDT.4"
)


output=""


function PrintPrice {
  symbol=$1
  price=$2
  color=$3

  if [ ! -z $color ]; then
    echo "$symbol: %{F$color}$price%{F-}"
    return
  fi 
  echo "$symbol $price"
}

for indexCoinSymbol in ${!COIN_SYMBOLS[*]}; do

  coinSymbol=$(echo ${COIN_SYMBOLS[$indexCoinSymbol]%%.*})
  floatPoint=$(echo ${COIN_SYMBOLS[$indexCoinSymbol]} | sed "s|$coinSymbol.||")
  tempCoinSymbol=$(echo $coinSymbol | sed 's|/||')
  coinFile=$(echo $coinSymbol | sed 's|/|-|')

  if [ $indexCoinSymbol != ${#COIN_SYMBOLS[*]} ]; then
    output+=" "
  fi

  price=$(curl -G -s "https://api1.binance.com/api/v3/ticker/price" -d "symbol=$tempCoinSymbol" | jq -r ".price" )
  price=$(printf "%.${floatPoint}f" $price)

  
  if [ ! -f "$ratesDirectory/$coinFile" ]; then
    output+=$(PrintPrice $coinSymbol $price)
    echo $price > "$ratesDirectory/$coinFile"
    continue
  fi

  prevPrice=$(cat $ratesDirectory/$coinFile)

  if [ $prevPrice == "" ]; then 
    output+=$(PrintPrice $coinSymbol $price)
    echo $price > "$ratesDirectory/$coinFile"
    continue
  fi

  if (( $(echo "$price < $prevPrice" | bc -l) )); then
    output+=$(PrintPrice $coinSymbol $price $dropColor)
  elif (( $(echo "$price > $prevPrice" | bc -l) )); then
    output+=$(PrintPrice $coinSymbol $price $riceColor)
  else (( $(echo "$price == $prevPrice" | bc -l) ));
    output+=$(PrintPrice $coinSymbol $price)
  fi

  echo $price > "$ratesDirectory/$coinFile"
done

echo $output