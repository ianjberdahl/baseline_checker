# Works but needs to be confirmed and cleaned.

param (
    [Parameter(Mandatory=$true)]
    [array]$requiredVersions,

    [Parameter(Mandatory=$true)]
    [array]$hostname
)

$hostnameVersions   = Get-WmiObject -Class Win32_Product -ComputerName $hostname | Select-Object -Property Name,Version

foreach ($installed in $hostnameVersions) {
    $required = $hostnameVersions | Where-Object { $_.Name -eq $installed.Name }
    if ($installed.Name -match '\S') {
        Write-Host "$($installedr.Name)"
        Write-Host "$($installedr.Version)"
    } else {
    Write-Host -ForegroundColor Yellow "Skipped"
    }
    if ($required) { 
        Write-Host "Software $($installed.Name):"
        
        if ($installed.Version -ge $hostnameVersions) {
            Write-Host " Installed version $($installed.Version) is up to date."
    } else {
            Write-Host " Installed version $($installed.Version) is out of date."
            Write-Host " "
            Write-Host -ForegroundColor Red " Updated version $($required.Version) is required."
        }

    } else {
        Write-Host " Software $($installed.Name) is not installed on client."
    }
}

    