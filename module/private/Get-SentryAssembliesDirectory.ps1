function GetTFM
{
    # Source https://learn.microsoft.com/en-us/powershell/scripting/whats-new/differences-from-windows-powershell?view=powershell-7.4#net-framework-vs-net-core
    # PowerShell 7.4 - Built on .NET 8.0
    # PowerShell 7.3 - Built on .NET 7.0
    # PowerShell 7.2 (LTS-current) - Built on .NET 6.0 (LTS-current)
    # PowerShell 7.1 - Built on .NET 5.0
    # PowerShell 7.0 (LTS) - Built on .NET Core 3.1 (LTS)
    # PowerShell 6.2 - Built on .NET Core 2.1
    # PowerShell 6.1 - Built on .NET Core 2.1
    # PowerShell 6.0 - Built on .NET Core 2.0
    if ($PSVersionTable.PSVersion -ge '7.4')
    {
        return 'net8.0'
    }
    elseif ($PSVersionTable.PSVersion -ge '7.2')
    {
        return 'net6.0'
    }
    else
    {
        return 'net462'
    }
}

function Get-SentryAssembliesDirectory
{
    $dir = Split-Path -Parent $PSScriptRoot
    $dir = Join-Path $dir 'lib'
    $dir = Join-Path $dir (GetTFM)
    return $dir
}
