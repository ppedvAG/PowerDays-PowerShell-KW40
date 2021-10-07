<#
.Synopsis
   Skript zum Abfragen von LogOn / LogOff Events
.DESCRIPTION
   Mit diesem Skript können Sie auf dem lokalen oder auf einem Remote System folgende Arten von Events abfragen.
   Anmeldeevent
   Abmeldeevent
   fehlgeschlagene Anmeldung
.EXAMPLE
   Get-logonevents.ps1 -EventId 4624

   Bei der Verwendung mit EventID 4624 werden die Anmeldeevents abgefragt. Default werden die aktuellesten 5 Events ausgegeben.

   Index Time          EntryType   Source                 InstanceID Message
   ----- ----          ---------   ------                 ---------- -------
   19500 Okt 07 13:35  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   19497 Okt 07 13:35  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   19494 Okt 07 13:35  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   19490 Okt 07 13:34  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   19486 Okt 07 13:34  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....


.EXAMPLE
   Ein weiteres Beispiel für die Verwendung dieses Cmdlets
.PARAMETER EventId
    Mit diesem Parameter wird die zu abfragende EventID festgelegt.
    4624 Anmeldung
    4625 fehlgeschlagene Anmeldung
    4634 Abmeldung
.LINK
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comment_based_help?view=powershell-5.1#comment-based-help-keywords
Doku zu Comment based Help
#>
[cmdletBinding()]
param(
[string]$Computername = "localhost",

[Parameter(Mandatory=$true)]
[ValidateSet(4624,4625,4634)]
[int]$EventId,

[Validaterange(5,10)]
[int]$Newest = 5
)
$Newest = 3
Write-Verbose -Message "ZusatzInfo: Vom User wurde folgende EventID übergeben: $EventId"
Get-EventLog -LogName Security -ComputerName $Computername | Where-Object EventId -eq $EventId | Select-Object -First $Newest