<#
.SYNOPSIS
Postional Binding
.LINK
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced_parameters?view=powershell-5.1#attributes-of-parameters
#>
[cmdletBinding(PositionalBinding=$false)]
param(
[Parameter(Position=0)]
[string]$Parameter1,

[Parameter()]
[string]$Parameter2,

[Parameter()]
[string]$Parameter3
)