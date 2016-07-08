#!/bin/sh
# Sijoita tähän kansioon A+:n tuottamat csv-tiedostot ja aja tämä skripti.
# Muutokset: sarakeotsikot järkeviksi, virhevastausten poisto, monivalintavastaukset numeroiksi, anonymisointi, moniriviset vastaukset yksirivisiksi

for i in *.csv
do
	echo $i
	echo "Time,suosittelu,hyvaa,loppuun_syy_2,loppuun_syy_3,loppuun_syy_4,loppuun_syy_5,loppuun_syy_6,loppuun_syy_7,loppuun_syy_8,loppuun_syy_9,loppuun_syy_10,sisallot_1,kehitettava,sisallot_2,sisallot_3,sisallot_4,sisallot_5,sisallot_6,sisallot_7,sisallot_8,sisallot_9,sisallot_10,sisallot_11,lisaa,sisallot_12,sisallot_13,sisallot_14,sisallot_15,sisallot_16,sisallot_17,sisallot_18,sisallot_19,sisallot_20,sisallot_21,pois,sisallot_22,miten_loysit,nopeus,loppuun,kesken_syy,loppuun_syy_1," >../$i
	cat $i|tail -n +2|sed -e :a -e '/[^\"]$/N; s/\n/ /; ta'|grep ',ready,[01],'|sed 's/"option_\([0-9+]\)"/\1/g'|sed 's/option_\([0-9+]\)/\1/g'|cut -d ',' -f 1,5->>../$i
done




