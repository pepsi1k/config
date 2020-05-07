#!/bin/sh

FULL_INFO=""

DATA=$(curl -s "https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5")

currency_names=("USD" "EUR" "RUR")
currency_chars=("" "" "")

for i in ${!currency_names[*]}
do
	if [[ "${currency_names[$i]}" == "$(echo $DATA | jq -r ".[$i].ccy")" ]]; then
		temp_buy=$(echo $DATA | jq -r ".[$i].buy")
		temp_buy=$(printf "%.2f" $temp_buy)

		temp_sale=$(echo $DATA | jq -r ".[$i].sale")
		temp_sale=$(printf "%.2f" $temp_sale)
		FULL_INFO+="${currency_chars[$i]} $temp_buy/$temp_sale "
		INFO+="${currency_chars[$i]} $temp_sale "
	fi
done

#echo -e $FULL_INFO
echo -e $INFO

