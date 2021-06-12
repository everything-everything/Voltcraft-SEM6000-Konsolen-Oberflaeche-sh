# Voltcraft-SEM6000-Konsolen-Oberflaeche-im *.sh Format

Linux Konsolen Oberfläche für Voltcraft SEM6000. 

Wie das ganze in der Verwendung aussieht sehen Sie hier: https://www.youtube.com/watch?v=hi06S4MO6H8

Der Untergrund basiert auf Hackies75 Expect Script SEM6000.EXP   
Die Original Datei von ./bin/SEM6000.EXP wurde an folgener Stelle modifiziert. Um den Funktionsumfang der SEM6000.EXP sowie des Volcraft Gerätes als auch die Funktionsweise der Software Nachzulesen, lesen Sie hier nach https://github.com/Heckie75/voltcraft-sem-6000

Zeile 41 : set KNOWN_SEMS_FILE "~/.known_sem6" zu set KNOWN_SEMS_FILE "./bin/known_sem6.config"

dass es ssh kompatibel ist.

Der Skript der Oberfläche Orientiert sich an den Untergrund:

https://bash.cyberciti.biz/guide/Menu_driven_scripts

Systemvorrausetzungen (getestet): In VirtualBox mit Q4OS Linux mit Trinity Oberfläche (Basiert auf Debian 10 läuft eventuell auch auf Ubuntu und co) Bluetooth 4.0 USB Dongle , Intel(R) Wireless Bluetooth(R)

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

Installationen die nötig sind:

Installation von Expect

  -  sudo apt install expect

Installation von blu

sudo apt-get -y install bluetooth bluez bluez-tools rfkill

bt-device l: 

sudo apt-get -y install bluetooth bluez bluez-tools rfkill
https://computingforgeeks.com/connect-to-bluetooth-device-from-linux-terminal/

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


Kapitel 1: Konfigurationen der Dateien für die Oberfläche 


- Konfiguration der known_sem6.config:


Damit das ganze Funktioniert, muss die Datei "./bin/known_sem6.config" konfiguriert
werden. 

Inhalt der known_sem6.config: MAC / PIN / Bezeichnung 

|  MAC-Adresse   |PIN| Name des Messgerätes 
FC:69:47:06:CB:C6 0000  Voltcraft

Erläuterung
Name des Messgerätes: 

in ./bin/Wattsekunden.sh oder auch Status.sh steht

|-------Script----| Namen des Messgerätes

./bin/sem-6000.exp Volt

::::::: Konfiguration der *.Desktop Dateien :

Dienen als Verknüpfung zu ./run_desktop.sh und ./Terminal.sh das man dann von einem Dateimanager wie Konquer oder dem Schreibtisch aus Starten kann.

Öffnen Sie diese in einem beliebigen Texteditor

- Konfiguration der .Desktop Dateien : 

   1) Bitte die Pfade bei Run_Desktop.desktop : 

Exec[$e]='/media/sf_Linux/Voltcraft/expect/Run_Deskop.sh'
...
...
Path[$e]=/media/sf_Linux/Voltcraft/expect  


  2) Terminal.Desktop: 

...
Path[$e]=/media/sf_Linux/Voltcraft/expect 

::::::::::::::::::::::::::::::


Anwendungshinweise bei Bluetooth im Terminal:

https://changeofpace.de/2018/04/05/bluetooth-geraete-mit-der-konsole-einrichten/

bluetoothctl

power on
agent on
default-agent

scan on
{Ergebnis}
scan off 
exit

Bereits hier sollte man die MAC-Adresse des Voltcraft Adapters haben.

Falls bluetoothctl keine Namen Ausdruckt: 

Nun kann man auch  hcitool oder bt-device -l nutzen die nicht funktionieren wenn Bluetooth nicht richtig an gewesen ist.

gatttool für : $ sudo hcitool lescan E Scan ... --> Beispieladresse übernommen von Heckie75s Beschreibung: 

FC:69:47:06:CB:C6 Voltcraft 

Notiz: hcitool hat bei mir unter UBUNTU 2104 nicht funktioniert. Bei mir funktionierte bei UBUNTU2104 bt-device -l , dass man mit sudo apt-get install bluez-tools bekommt. Dies 
ist jedoch subjektiv. Ausgabe von bt-device -l: 
$: (00:00:00:00:00:00) Voltcraft

WICHTIG: Prüfen Sie vor dem Ausführen, dass die Konfigurationsdatei ./bin/known_sem6.config richtig Konfiguriert ist. Prüfen Sie ob der Virtuellen Maschine oder dem Linux der
Bluetooth 4.0 Adapter zugeteilt wurde und Betriebsbereit ist.

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

Verwendung der Oberfläche: 

Ausführung: 

Konsole: 

./run.sh ----> in SSH oder Konsole oder ./run_desktop.sh ausgeführt 

Benutzeroberfläche in Linux:

über ein Doppelkick auf run_desktop.Desktop

auf den Pfad in dem man Arbeitet und bei Run_Desktop wo die Datei liegt und wo diese Ausgeführt wird anpassen. Dies braucht man aber nur wenn man sich auf der Grafischen 
Oberfläche von Linux befindet und diese vom Desktop aus Öffnen will.

Ich  muss es noch testen ob man diese bei UBUNTU als ausführenden Script registrieren muss.

:::::::::::::::::::::


Protokolliert werden die Ergebnisse des Auslesens in ./Ergebnise

Der Status ist im TXT Format gespeichert. Die Tabelle im *.WKS Format. Diese lässt sich in Excel ohne Probleme Öffnen und direkt bearbeiten. Am besten man weißt das WKS Format
Excel im Explorer dann in Windows zu falls man Excel hat oder man öffnet es in LibreOffice oder OpenOffice.


Release: Version 0.5 

Funktionen: Terminal Basierte Oberfläche für: Status Anzeige und Protokollierung Protokollierung von Watt in Sekunden sowie festlegung des Zeitraum

Geplante Features in Naher Zukunft:

Konfiguraion der Konfigurationsdatei über die Oberfläche
Geplante Features in weiter Ferne: -Features die SEM6000.EXP bietet nach und nach in die Terminal Oberfläche zu Integieren.

Have fun

Everything-Everything
