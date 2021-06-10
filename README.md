# Voltcraft-SEM6000-Konsolen-Oberflaeche-im *.sh Format


Linux Konsolen Oberfläche für Voltcraft SEM6000. 

Wie das ganze in der Verwendung aussieht sehen Sie hier: https://www.youtube.com/watch?v=hi06S4MO6H8

Der Untergrund basiert auf Hackies75 Expect Script SEM6000.EXP   
Die Original Datei von ./bin/SEM6000.EXP wurde an folgener Stelle modifiziert. Um den Funktionsumfang der SEM6000.EXP sowie des Volcraft Gerätes als auch die Funktionsweise der Software Nachzulesen, lesen Sie hier nach https://github.com/Heckie75/voltcraft-sem-6000

Zeile 41 : set KNOWN_SEMS_FILE "~/.known_sem6" zu set KNOWN_SEMS_FILE "./bin/known_sem6.config"

dass es ssh kompatibel ist.

Gestartet wird die Oberfläche ./run.sh oder über run_desktop.desktop die die ./run_desktop.sh Startet. Damit das ganze Funktioniert, muss die Datei "./bin/known_sem6.config" konfiguriert werden. Je nachdem muss man die Pfade beim Desktop run mit dem Texteditor in run_desktop.Desktop Anpassen.

Inhalt der known_sem6.config: MAC / PIN / Bezeichnung FC:69:47:06:CB:C6 0000 fridge

Der Skript der Oberfläche Orientiert sich an den Untergrund:

https://bash.cyberciti.biz/guide/Menu_driven_scripts

Systemvorrausetzungen (getestet): Q4OS Linux mit Trinity Oberfläche (Basiert auf Debian 10 läuft eventuell auch auf Ubuntu und co) Bluetooth 4.0 USB Dongle , Intel(R) Wireless Bluetooth(R)

Installation sudo apt install expect

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

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

Nun kann man auch  hcitool oder bt-device -l nutzen. Wenn man beim Scan den Voltcraft nicht ermitteln konnte.

gatttool für : $ sudo hcitool lescan E Scan ... --> Beispieladresse übernommen von Heckie75s Beschreibung: 

FC:69:47:06:CB:C6 Voltcraft

Notiz: hcitool hat bei mir nicht funktioniert. Bei mir funktionierte bt-device -l , dass man mit sudo apt-get install bluez-tools bekommt. Dies ist jedoch subjektiv. Ausgabe von bt-device -l: 
$: (00:00:00:00:00:00) Voltcraft

WICHTIG: Prüfen Sie vor dem Ausführen, dass die Konfigurationsdatei ./bin/known_sem6.config richtig Konfiguriert ist. Prüfen Sie ob der Virtuellen Maschine oder dem Linux der Bluetooth 4.0 Adapter zugeteilt wurde und Betriebsbereit ist.

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

Verwendung der Oberfläche: 

Ausführung: ./run.sh ----> in SSH oder Konsole oder ./run_desktop.sh ausgeführt über ein Doppelkick auf run_desktop.Desktop

::::::::::::::::::::: 

Konfiguration *.DESKTOP Dateien. 

Bitte die Pfade bei Run_Desktop.desktop : 

Exec[$e]='/media/sf_Linux/Voltcraft/expect/Run_Deskop.sh'
...
...
Path[$e]=/media/sf_Linux/Voltcraft/expect  

und bei Terminal.Desktop

...
Path[$e]=/media/sf_Linux/Voltcraft/expect 


auf den Pfad in dem man Arbeitet und bei Run_Desktop wo die Datei liegt und wo diese Ausgeführt wird anpassen. Dies braucht man aber nur wenn man sich auf der Grafischen Oberfläche von Linux befindet und diese vom Desktop aus Öffnen will.

Ansonsten kann man  ./run.sh oder über ./run_desktop.sh im Terminal aufrufen. Bei Q4OS funktioniert das ausführen der Scripts ohne zutun. 

Ich  muss es noch testen ob man diese bei UBUNTU als ausführenden Script registrieren muss.


:::::::::::::::::::::


Protokolliert werden die Ergebnisse des Auslesens in ./Ergebnise

Release: Version 0.5 BETA

Funktionen: Terminal Basierte Oberfläche für: Status Anzeige und Protokollierung Protokollierung von Watt in Sekunden sowie festlegung des Zeitraum

Geplante Features in Naher Zukunft:

Konfiguraion der Konfigurationsdatei über die Oberfläche
Geplante Features in weiter Ferne: -Features die SEM6000.EXP bietet nach und nach in die Terminal Oberfläche zu Integieren.

Have fun

Everything-Everything
