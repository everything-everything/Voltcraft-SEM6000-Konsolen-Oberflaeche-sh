#!/bin/bash
# A menu driven shell script sample template 
## ----------------------------------
# Step #1: Define variables
# ----------------------------------
EDITOR=vim
RED='\033[0;41;30m'
STD='\033[0;0;39m'
 
# ----------------------------------
# Step #2: User defined function
# ----------------------------------
pause(){
  read -p "Drücken Sie [Enter] um Fortzufahren ..." fackEnterKey
}

show_menus(){
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-"	
	echo "|									 |"
	echo "| 			     Voltcraft SEM6000 				 |"
	echo "| 				Beenden 				 |"
	echo "| 									 |"	
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-"
	echo "	    "
	echo "	    1. Beenden                             "
	echo "	    2. Linux-Konsole            "
	echo "	    3. Zurück zum Hauptmenü"	
	echo "	    				  "
	echo "	    "
}

        

one(){
	echo "Beenden"
	sleep 1
	killall konsole
	}

two(){
	echo "Linux-Konsole"
	pause
	/bin/bash
	exit
	}

three(){
	echo "Hauptmenü"
	./Run_Deskop.sh
	break 0
	}
# read input from the keyboard and take a action
# invoke the one() when the user select 1 from the menu option.
# invoke the two() when the user select 2 from the menu option.
# Exit when user the user select 3 form the menu option.




read_options(){
	local choice
	read -p "Enter choice [ 1 - 3] " choice
	case $choice in
		1) one ;;
		2) two ;;
		3) three ;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}
 
# ----------------------------------------------
# Step #3: Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
trap '' SIGINT SIGQUIT SIGTSTP
 
# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do
 	show_menus
	read_options
done








#read Filename
#while : 
#do
#printf "Wie lange soll gemessen werden in Sekunden: "
#read Sekunden 
#[ $Sekunden -ge 0 ] 1>/dev/null 2>&1 && break
#done
#script -a ./Ergebnis/$Filename.txt -c "./sem-6000.exp Volt --measure header --measure $Sekunden"

