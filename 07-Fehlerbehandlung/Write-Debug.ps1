[cmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [string]$text
)
Write-Debug -Message "Vor erster Ausgabe"
Write-Host -object "1. $text" -ForegroundColor Magenta

Write-Debug -Message "Vor zweiter Ausgabe aber nach erster"
Write-Host -object "2. $text" -ForegroundColor Cyan

Write-Debug -Message "Vor dritter Ausgabe aber nach zweiter"
Write-Host -object "3. $text" -ForegroundColor Green