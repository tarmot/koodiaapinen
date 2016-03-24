#!/bin/sh
# Sijoita tähän kansioon A+:n tuottamat csv-tiedostot ja aja tämä skripti.
# Muutokset: sarakeotsikot järkeviksi, virhevastausten poisto, monivalintavastaukset numeroiksi, anonymisointi

for i in *.csv
do
	echo $i
	echo "Time,ajankaytto,tyo_materiaali,tyo_harjoitukset,haaste_materiaali,haaste_harjoitukset,hyodyllisyys,innostavuus,soveltuvuus,mita_opin,vapaa_palaute" >../$i
	cat $i|tail -n +2|grep ',ready,[01],'|sed 's/"option_\([0-6]\)"/\1/g'|cut -d ',' -f 1,5->>../$i
done