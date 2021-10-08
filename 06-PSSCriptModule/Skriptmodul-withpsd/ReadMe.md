# SkriptModul mit Auto Import

Das PowerShell Skript Module automatisch geladen werden können müssen die .psd1 und der Ordnername gleich benannt sein. Der Name des Ordners entspricht auch dann dem Namen des Moduls. Desweiteren muss sich der Ordner im "richtigen" Pfad befinden. Wichtig ist auch das die .psm1 Datei in dem Manifest angegeben wir bei "RootModule".
Sowie die zu exportierenden Functions als FunctionToExport. 

Den richtigen Pfad kann man der Umgebungsvariable PSModulePath entnehmen welcher wie folgt über die PowerShell abefragt werden kann:

`$env:PSModulepath`

Standardmäßig existieren 3 Pfade:

Der Pfad in den eigenen Dokumenten ist gedacht für eigene SkriptModule.

Der Pfad in den Programm Files ist gedacht für SkriptModule welche Systemweit verwendet werden können von mehreren Usern.

Der Pfad System32 ist gedacht für Microsoft offizielle Module und sollte auch nicht für eigene Module verwendet werden.