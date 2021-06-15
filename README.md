# Voltcraft-SEM6000-Konsolen-Oberflaeche-im *.sh Format

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

Version history / Functions

Version 1.1 Changes :
/Setup/Blue.sh ---> Paths fixed
/bin/Beenden.sh ---> Paths fixed for Version 1.0
Automatical Startup up of Run.sh after Setup


Version 1.0 Changes:
Add Functions :

Automatical Bluetooth Setup
Adds *.sh Scripts to Linux System that you can Use it under UBUNTU

Add /Setup.sh
Add /Blue.sh



Version 0.5 inital Release:

Menu Interface
Status status query
Energie Meter Watt in Second

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::




Linux Konsolen Oberfläche für Voltcraft SEM6000. 

Wie das ganze in der Verwendung aussieht sehen Sie hier: https://www.youtube.com/watch?v=hi06S4MO6H8

Der Untergrund basiert auf Hackies75 Expect Script SEM6000.EXP   
Die Original Datei von ./bin/SEM6000.EXP wurde an folgener Stelle modifiziert. Um den Funktionsumfang der SEM6000.EXP sowie des Volcraft Gerätes als auch die Funktionsweise der 
Software Nachzulesen, lesen Sie hier nach https://github.com/Heckie75/voltcraft-sem-6000

Zeile 41 : set KNOWN_SEMS_FILE "~/.known_sem6" zu set KNOWN_SEMS_FILE "./bin/known_sem6.config"

dass es ssh kompatibel ist.

Der Skript der Oberfläche Orientiert sich an den Untergrund:

https://bash.cyberciti.biz/guide/Menu_driven_scripts

Systemvorrausetzungen (getestet): 
In VirtualBox mit Q4OS Linux mit Trinity Oberfläche (Basiert auf Debian 10)
Oder  Ubuntu OS - nur *.SH Oberfläche läuft ohne die *.desktop Verknüpfung 
Bluetooth 4.0 USB Dongle , Intel(R) Wireless Bluetooth(R)

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

Installationen die nötig sind:

Installation von Expect

  -  sudo apt install expect

Installation von blu

sudo apt-get -y install bluetooth bluez bluez-tools rfkill

bt-device l: 

sudo apt-get -y install bluetooth bluez bluez-tools rfkill
https://computingforgeeks.com/connect-to-bluetooth-device-from-linux-terminal/

gatttool für : $ sudo hcitool lescan ist vermutlich auch in den bluez tools oder expect enthalten. Konnte ich nicht rausfinden.

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

Automatisches Konfigurieren

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

Prüfen Sie ob Ihre Bluetooth Dienste als auch Stick Arbeiten und Installieren Sie falls
nicht vorhanden das Bluetooth Ordnungsgemäß und Achten Sie darauf, das Bluetooth 
Ordentlich Konfiguriert ist und Bluetoothctl sowie bt-device -l arbeiten.

Prüfen Sie ob die Befehle Bluetoothctl und bt-device -l Verfügbar sind. 

Notfalls installieren Sie diese mit 

sudo apt-get -y install bluetooth bluez bluez-tools rfkill

Öffnen Sie die Konsole im entpackten Hauptverzeichnis des Programms Führen Sie als erstes dies hier aus:
Sudo chmod +x ./Setup/Setup.sh


Anschließend gehen Sie in das Verzeichnis setup und starten Sie die Konfiguration mit:

./Setup.sh 

Falls dieser nach "Die Skript Dateien wurden Registriert" hängt, Prüfen Sie ob der 
Bluetooth Adatpter richtig angeschlossen ist und Software dazu installiert ist.  
Oft reicht es den USB Bluetooth Adapter neu einzustecken oder bei Virtual Box  einzubinden und es nochmal zu versuchen.
Mehr dazu in Fehlerbehebungen. 

Der Skript lässt sich and der Stelle mit [STRG] + [c] oder [STRG] + [ALT] +  [c] Je nach Linux beenden

Diese Registriert alle Notwendigen *.SH 
Skripte. Diese Führt die Bluetooth Konfiguration für die SEM6000 mit Standard Parameter durch und 
schreibt dessen Konfigurationsdatei mit hilfe von Bluetoothctl und bt-device -l. 

Mit ./Blue.sh können Sie die Bluetoothkonfiguration in der known_sem6.config Automatisch vornehmen lassen. 
mit [STRG] + [c] oder [STRG] + [ALT] +  [c] lässt sich dieses auch Beenden.


Anschließend können Sie das mit ./Run im Hauptverzeichnis Des Skript Programms den Voltcraft SEM6000 
nutzen und die Ergebnisse in /Ergebnis einsehen.

Diese liegen im *.WKS Format als auch im TXT Format vor. WKS lässt sich in LibreOffice/ OpenOffice und 
Excel einfach bearbeiten

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

Fehlerbehebungen

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

Manuelles Workaround falls es nicht funktioniert :

Geben Sie hierzu einmal Bluetoothctl als auch bt-device -l ein um zu Prüfen ob diese installiert sind. 
In Bluetoothctl können Sie Bluetoothctl wie folgt konfigurieren in folgender Reihenfolge:

Falls nicht verfügbar: 

agent on
default-agent
power on
devices
scan on 
scan off 
exit


Anschließen kann man mit SCAN On  --- und Scan Off die Bereitschaft des Bluetooth Dongels im Linux 
Terminal feststellen. Der Skript führt die Schritte auch aus. Dies dient nur für ein Manuelles 
Workaround.!
::::::::::::::::::::::::::

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


Release: Version 1.0 

Funktionen: Terminal Basierte Oberfläche für: Status Anzeige und Protokollierung Protokollierung von Watt in Sekunden sowie festlegung des Zeitraum

Geplante Features in Naher Zukunft:

Konfiguraion der Konfigurationsdatei über die Oberfläche
Geplante Features in weiter Ferne: -Features die SEM6000.EXP bietet nach und nach in die Terminal Oberfläche zu Integieren.

Have fun

Everything-Everything
