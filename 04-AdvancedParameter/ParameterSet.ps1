<#
.SYNOPSIS
ParameterSetName
.LINK
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced_parameters?view=powershell-5.1#attributes-of-parameters
#>
[cmdletBinding(DefaultParameterSetName="Set2")]
param(
    [Parameter(Mandatory=$true, ParameterSetName="Set1")]
    [string]$Parameter1,

    [Parameter(ParameterSetName="Set2")]
    [string]$Parameter2 = "test",

    [Parameter(ParameterSetName="Set1")]
    [Parameter(ParameterSetName="Set2", Mandatory=$true)]
    [string]$Parameter3
)

