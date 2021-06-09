# Voltcraft-SEM6000-Konsolen-Oberflaeche-im *.sh Format
Linux Konsolen Oberfläche für Voltcraft SEM6000. Der Untergrund basiert auf Hackies75 Expect Script SEM6000.EXP   
Die Original Datei von ./bin/SEM6000.EXP wurde an folgener Stelle modifiziert. Um den Funktionsumfang der SEM6000.EXP sowie des Volcraft Gerätes als auch die Funktionsweise der Software Nachzulesen, lesen Sie hier nach https://github.com/Heckie75/voltcraft-sem-6000

Zeile 41 : set KNOWN_SEMS_FILE "~/.known_sem6" zu set KNOWN_SEMS_FILE "./bin/known_sem6.config"

dass es ssh kompatibel ist.

Gestartet wird die Oberfläche ./run.sh oder über run_desktop.desktop die die ./run_desktop.sh Startet. Damit das ganze Funktioniert, muss die Datei "./bin/known_sem6.config" konfiguriert werden. Je nachdem muss man die Pfade beim Desktop run mit dem Texteditor in run_desktop.Desktop Anpassen.

Inhalt der known_sem6.config: MAC / PIN / Bezeichnung FC:69:47:06:CB:C6 0000 fridge

Der Skript der Oberfläche Orientiert sich an den Untergrund:

https://bash.cyberciti.biz/guide/Menu_driven_scripts

Systemvorrausetzungen (getestet): Q4OS Linux mit Trinity Oberfläche (Basiert auf Debian 10 läuft eventuell auch auf Ubuntu und co) Bluetooth 4.0 USB Dongle , Intel(R) Wireless Bluetooth(R)

Installation sudo apt install expect

gatttool für : $ sudo hcitool lescan E Scan ... --> Beispieladresse übernommen von Heckie75s Beschreibung: 

FC:69:47:06:CB:C6 Voltcraft

Notiz: hcitool hat bei mir nicht funktioniert. Bei mir funktionierte bt-device -l , dass man mit sudo apt-get install bluez-tools bekommt. Dies ist jedoch subjektiv. Ausgabe von bt-device -l: 
$: (00:00:00:00:00:00) Voltcraft

WICHTIG: Prüfen Sie vor dem Ausführen, dass die Konfigurationsdatei ./bin/known_sem6.config richtig Konfiguriert ist. Prüfen Sie ob der Virtuellen Maschine oder dem Linux der Bluetooth 4.0 Adapter zugeteilt wurde und Betriebsbereit ist.

Ausführung: ./run.sh ----> in SSH oder Konsole oder ./run_desktop.sh ausgeführt über ein Doppelkick auf run_desktop.Desktop

Protokolliert werden die Ergebnisse des Auslesens in ./Ergebnise

Release: Version 0.5 BETA

Funktionen: Terminal Basierte Oberfläche für: Status Anzeige und Protokollierung Protokollierung von Watt in Sekunden sowie festlegung des Zeitraum

Geplante Features in Naher Zukunft:

Konfiguraion der Konfigurationsdatei über die Oberfläche
Geplante Features in weiter Ferne: -Features die SEM6000.EXP bietet nach und nach in die Terminal Oberfläche zu Integieren.

Wie das ganze in Aktion aussieht: https://www.youtube.com/watch?v=hi06S4MO6H8

Have fun

Everything-Everything
