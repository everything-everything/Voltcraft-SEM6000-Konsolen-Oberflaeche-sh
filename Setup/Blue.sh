#!/bin/bash
echo " "
echo "Bluetoothkonfiguration wird gestartet"

{   

    printf 'agent on\n\n'
    printf 'default-agent\n\n'
    printf 'power on\n\n'
    printf 'scan on\n\n'
    sleep 2
    printf 'devices\n\n'
    printf 'quit\n\n'
} | bluetoothctl > ./Temp/Temp.txt

bt-device -l >> ./Temp/Temp.txt

echo " "
echo "Bluetooth wurde ausgelesen"

grep "Voltcraft" ./Temp/Temp.txt >> ./Temp/Variable.txt
cat ./Temp/Variable.txt | tr -d '(' | tr ')' '\n' > ./Temp/Ok.txt
# cut -c 2- > ./Temp/Ok2.txt
cat ./Temp/Ok.txt | sed 1s/Device//g | sed 's/^ //' > ./Temp/Ok2.txt
i=1
z="$1"
MAC=MAC
MAC1=$(cat ./Temp/Ok2.txt | head -n 1 | cut -d' ' -f1)
MAC2=$(cat ./Temp/Ok2.txt | head -n 1 | cut -d' ' -f2)
MAC3=$(cat ./Temp/Ok2.txt | grep -m 2 -o '.*' | cut -d' ' -f 1 | tail -n 1)
MAC4=$(cat ./Temp/Ok2.txt | grep -m 2 -o '.*' | cut -d' ' -f 2 | tail -n 1)
echo $MAC1
MACC1=$(echo $MAC1 | wc -c)
MACC2=$(echo $MAC2 | wc -c)
MACC3=$(echo $MAC3 | wc -c)
MACC4=$(echo $MAC4 | wc -c)
Verg=0
i=1

ok=$i
MACC=MACC
for i in $(seq 1 $ok); 
do
MACCERG="MACC$i"
MACCERG=$(echo ${!MACCERG})

done

while [ $MACCERG -ne 18 ] 
do
i=$[$i+1]  
MACCERG="MACC$i"
MACCERG=$(echo ${!MACCERG})

done 

echo $MACCERG

maxn=$i
for i in $(seq 1 $maxn); 
do
  MACERG="MAC$i"
  MACERG=$(echo ${!MACERG})
done
 

echo $i
echo $z
echo $MACERG
echo $MACERG 0000 Voltcraft > ./Temp/known_sem6.config
cd .. 
cp ./Setup/Temp/known_sem6.config ./bin/known_sem6.config
cd Setup
cd Temp
rm *.*
cd ..
cd ..
./Run.sh
/bin/bash
#printf "Wie soll Ihr Gerät heißen?: "
#read  
#sed -i 'Device ' '' ./Temp/OK.txt
#MACC=($MACC1 $MACC2 $MACC3 $MACC4)



# until [ $i -eq ${#MACC[@]} ] ;
#do
#Verg=${MACC[${i}]}
#echo "Hochzählen $i --- MACC[$i] == $Verg"
#[ $Verg -eq 18 ] && break
#i=$[$i+1]
#done

#MACERG=MAC
