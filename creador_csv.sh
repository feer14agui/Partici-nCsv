 #! /bin/bash

Filtros="Filtros.env"
V_NUM_API_MAX="$(cat "$(echo "$Filtros" | sed s/"\.\/"/""/g)" | grep "^Filter_")"
Fich_Destino="api_complete.csv"

for str_V_NUM_API_MAX in $(echo $V_NUM_API_MAX)
do
	V_NAME_FILE="api_""$(echo "$str_V_NUM_API_MAX" | awk 'BEGIN {FS="="} { print $1 }' | awk 'BEGIN {FS="Filter_"} { print $2 }')"".csv"
	cat $Fich_Destino | grep -iE "$str_V_NUM_API_MAX" > $V_NAME_FILE
done
