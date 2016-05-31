#!/bin/sh
# Laskee numeeristen palautteiden keskiarvot. Koska numerot 1-5 on koodattu arvoiksi 0-4, lasketaan +1 jokaiseen arvoon.

echo "jakso,tyo_materiaali,tyo_harjoitukset,haaste_materiaali,haaste_harjoitukset,hyodyllisyys,innostavuus,soveltuvuus"
for i in *-?.csv
do
  printf $i
  printf ","
  for j in {3,4,5,6,7,8,9}
  do
    cat $i |cut -d ',' -f $j|awk '{ rows+=1; sum+= $1+1; } END {printf sum/rows;}'
    if [ $j -lt 9 ]; then
     printf ","
    fi
  done
  echo
done
