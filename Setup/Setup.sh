#!/bin/bash
cd ..
Path=$(pwd)
cd Setup
e='$e'
echo "Exec[$e]='$Path/Run.sh'" >> Run_Desktop.Desktop
echo "Path[$e]=$Path " >> Run_Desktop.Desktop
echo "Path[$e]=$Path " >> Terminal.Desktop
cp *.desktop $Path
cp ./Temp/Backup/*.desktop ./
sudo chmod +x ./Blue.sh
cd ..
sudo chmod +x ./Run.sh
sudo chmod +x ./bin/Beenden.sh
sudo chmod +x ./bin/Status.sh
sudo chmod +x ./bin/Wattsekunden.sh
sudo chmod +x ./bin/sem-6000.exp
echo "Die Skript Dateien wurden Registriert"
cd Setup
./Blue.sh
