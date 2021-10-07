<#
.Synopsis
   Skript, welches zur Erstellung von Ordnern und Dateien verwendet werden kann
.DESCRIPTION
   Skript, welches zur Erstellung von Ordnern und Dateien verwendet werden kann
   Die Parameter sind absolut sinnvoll validiert, der Pfad zum Erstellen des
   Ordners inklusive der Dateien kann frei gewählt werden innerhablb des Filesystems
.EXAMPLE
   .\Aufgabe13.ps1 -AnzahlOrdner 5 -AnzahlFiles 4 -Pfad C:\LOL
.EXAMPLE
   .\Aufgabe13.ps1 -AnzahlOrdner 6 -AnzahlFiles 3
#>
[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[ValidateRange(1,10)]
[int]$AnzahlOrdner,
[Parameter(Mandatory=$true)]
[ValidateRange(1,1000)]
[int]$AnzahlFiles,
[ValidateScript({$_.StartsWith("C:\")})]
[string]$Pfad = "C:\Aufgabe"
)

#Entsprechend viele Ordner erstellen, wie vom User gewünscht

for ($i=1; $i -le $AnzahlOrdner; $i++)
{
    New-Item -Path $Pfad\Testfiles\ -Name Ordner$i -ItemType "directory"

    #geschachtelte Schleife zum erstellen der SubFiles unter den Ordnern
    for ($j=1; $j -le $AnzahlFiles; $j++)
    {
        New-Item -Path $Pfad\Testfiles\Ordner$i -Name "Ordner$i-file$j.txt" -ItemType "file"
    }
}

for ($i=1; $i -le $AnzahlFiles; $i++)
{
    New-Item -Path $Pfad\Testfiles\ -Name file$i.txt -ItemType "file"
}

echo "Es wurden $AnzahlOrdner Ordner und $AnzahlFiles Dateien im Pfad $Pfad\Testfiles\ abgelegt."