[cmdletBinding()]
param(
[string]$Computername = "localhost",

[Parameter(Mandatory=$true)]
[int]$EventId,

[int]$Newest = 5
)

Write-Verbose -Message "ZusatzInfo: Vom User wurde folgende EventID übergeben: $EventId"
Get-EventLog -LogName Security -ComputerName $Computername | Where-Object EventId -eq $EventId | Select-Object -First $Newest