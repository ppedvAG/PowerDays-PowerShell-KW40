<#
.Synopsis
   Skript zum erstellen von files und Ordnern
.DESCRIPTION
   Mit diesem Skript können Sie auf dem lokalen filesystem ein ordner und files erzeugen
   Ordner
   Files
   path
.EXAMPLE
   scripting.ps1 -Ordner [x] -Files [y]
   es werden x ordner mit je y files erstellt
.LINK
https://regex101.com/ 
Mehr zu Regex
#>
[cmdletBinding()] 
param ( 
  [Parameter(Mandatory=$true)] 
  [Validaterange(1,100)] 
  [int] $Ordner, 

  [Parameter(Mandatory=$true)] 
  [Validaterange(1,100)] 
  [int] $Files,

  [ValidateScript({Test-Path $_ -PathType Container})]
  [string] $path
) 
Write-Verbose -Message "ZusatzInfo: Vom User wurde folgendes übergeben: $Ordner Ordner $Files Files"

$orginalpfad = pwd #Tipp: Keine kurzformen! In SKripten immer vollformen verwenden pwd -> Get-Location 
cd $path
write-host "Ich benutze Ordner $path"

for ($i=1; $i -le $Ordner; $i++) 
{
    New-Item -ItemType Directory Folder$i
    cd Folder$i
    for ($ii=1; $ii -le $Files; $ii++) 
    {
        New-Item -ItemType File -name MFile$ii.txt -Value 'Ordner$i und Testfile$ii'
    }
    cd ..
}

for ($ii=1; $ii -le $Files; $ii++) {
    New-Item -ItemType File -name MFile$ii.txt -Value 'Ordner$i und Testfile$ii' #Anmerkung: Einfach Anf�hrungsstriche Variablenname, doppelte Variablenwert
}

cd $orginalpfad
# New-Item -ItemType File -Name Hello123.txt -Value Testfile
