echo "Dateiname der Log-Datei?"
read Filename
while : 
do
printf "Wie lange soll gemessen werden in Sekunden: "
read Sekunden 
[ $Sekunden -ge 0 ] 1>/dev/null 2>&1 && break
done
script -a ./Ergebnis/$Filename.wks -c "./bin/sem-6000.exp Volt --measure header --measure $Sekunden"
cat ./Ergebnis/$Filename.wks | tr -d "\r" | tr . , >./Ergebnis/$Filename1.wks 
cp ./Ergebnis/$Filename1.wks ./Ergebnis/$Filename.wks
rm ./Ergebnis/$Filename1.wks
exit

