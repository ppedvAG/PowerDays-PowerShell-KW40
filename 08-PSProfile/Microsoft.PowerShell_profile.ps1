
function Set-ConsoleColors
{
    [cmdletBinding()]param()

    $Host.Ui.RawUI.WindowTitle = "Stefano Shell"
    $Host.Ui.RawUI.BackgroundColor = [ConsoleColor]::White
    $Host.ui.RawUI.ForegroundColor = [ConsoleColor]::Black

    if((Get-Command Set-PSReadLineOption).Version.Major -lt 2)
    {
        Set-PSReadLineOption -TokenKind Command -ForeGroundColor DarkBlue

    }
    else {
        Set-PSReadLineOption -Colors @{
                                        "Command" = [ConsoleColor]::DarkBlue
                                        "Comment" = [ConsoleColor]::DarkGreen

        }
    }
    Clear-Host
}

Set-ConsoleColors