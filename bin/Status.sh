script -a ./Ergebnis/Status.txt -c "./bin/sem-6000.exp Volt --status --print"
cat ./Ergebnis/Status.txt | tr -d "\r" | tr . , >./Ergebnis/Status1.txt
cp ./Ergebnis/Status1.txt ./Ergebnis/Status.txt
rm ./Ergebnis/Status1.txt
exit

