﻿[cmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [ValidateScript({Test-Path -Path $PSItem})]
    [string]$Path,

    [ValidateLength(2,20)]
    [string]$DirName = "Testfiles",

    [ValidateRange(1,999)]
    [int]$DirCount,

    [ValidateRange(1,999)]
    [int]$FileCount,

    [switch]$Force
)

#prüfen ob Pfad mit \ endet
if($Path.EndsWith("\"))
{
    $TestFilesPath = $Path + $DirName
}
else
{
    $TestFilesPath = $Path + "\" + $DirName
}

#prüfen ob TestFiles Ordner vorhanden, bei -Force wird ordner gelöscht, wenn nicht vorhanden wird er angelegt
if(Test-Path -Path $TestFilesPath)
{
    Write-Verbose -Message "Ordner $DirName bereits vorhanden"
    if($Force)
    {
        Write-Verbose -Message "Ordnerinhalt wird gelöscht"
        Get-ChildItem -Path $TestFilesPath | Remove-Item -Recurse -Force
    }
    else
    {
        Write-Host -Object "Ordner bereits vorhanden" -ForegroundColor Red
        exit
    }
}
else
{
    New-Item -Path $TestFilesPath -ItemType Directory
}

#Dateien im "Root" Verzeichnis anlegen
for($i = 1; $i -le $FileCount; $i ++)
{
    $filenumber = "{0:D3}" -f $i #zahl mit 3 führenden nullen erzeugen
    New-Item -Path $TestFilesPath -Name "File-$filenumber.txt" -ItemType File
}

#Ordner anlegen im "Root Verzeichnis"
for($i = 1; $i -le $DirCount; $i++)
{
    $dirnumber = "{0:D3}" -f $i

    #speichern des System.IO.DirectoryInfo Objekts was von new-item bei der ORdnererstellung erzeugt wird um es später wiederzuverwenden
    $Ordner = New-Item -Path $TestFilesPath -Name "Ordner$dirnumber" -ItemType Directory

    for($j = 1; $j -le $FileCount; $j ++)
    {
        $Filenumber = "{0:D3}" -f $j
        New-Item -Path $Ordner.FullName -Name "Ordner$Dirnumber-Datei-$filenumber.txt" -ItemType File
    }
}

