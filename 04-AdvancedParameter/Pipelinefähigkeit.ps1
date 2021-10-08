<#
.SYNOPSIS
PipeLinefähig
.LINK
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced_parameters?view=powershell-5.1#attributes-of-parameters
.EXAMPLE
Get-Process -Name notepad | .\Pipelinefähigkeit.ps1
#>
[cmdletBinding()]
param(
[Parameter(ValueFromPipeline=$true)] #Darf pro Datentyp nur einmal verwendet werden und matcht Property und Parameter über den Datentyp
[string]$Parameter1,

[Parameter(ValueFromPipelineByPropertyName=$true)] #PropertyName und ParameterName müssen identisch sein
[int]$PagedMemorySize64,

[Parameter(ValueFromRemainingArguments=$true)] #nimmt den Rest an der nicht gematcht werden kann
$Parameter3
)

Write-Host "Parameter1 = $Parameter1" -ForegroundColor DarkCyan
Write-Host "Parameter2 = $PagedMemorySize64" -ForegroundColor Cyan
Write-Host "Parameter3 = $Parameter3" -ForegroundColor DarkYellow