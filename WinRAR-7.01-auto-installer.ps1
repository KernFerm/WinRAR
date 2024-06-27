# Check if script is running as administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "This script must be run as an administrator. Right-click the PowerShell icon and select 'Run as administrator'."
    exit 1
}

# Function to download and install WinRAR
function Install-WinRAR {
    param (
        [string]$url,
        [string]$outputPath
    )

    try {
        Invoke-WebRequest -Uri $url -OutFile $outputPath -UseBasicParsing
        Write-Host "Download complete."
    } catch {
        Write-Error "Failed to download WinRAR installer."
        exit 1
    }

    try {
        Start-Process -FilePath $outputPath -ArgumentList "/S" -Wait
        Write-Host "WinRAR installation complete."
    } catch {
        Write-Error "Failed to install WinRAR."
        exit 1
    }
}

# URLs for WinRAR versions
$winrar32Url = "https://www.win-rar.com/postdownload.html?&L=0&Version=32bit"
$winrar64Url = "https://www.win-rar.com/postdownload.html?&L=0&Version=64bit"

# Prompt user for version choice
$versionChoice = Read-Host "Enter the version of WinRAR you want to install (32bit or 64bit)"

# Determine URL based on user input
if ($versionChoice -eq "32bit") {
    $url = $winrar32Url
    $outputPath = "$env:TEMP\winrar-32bit-installer.exe"
} elseif ($versionChoice -eq "64bit") {
    $url = $winrar64Url
    $outputPath = "$env:TEMP\winrar-64bit-installer.exe"
} else {
    Write-Error "Invalid choice. Please enter '32bit' or '64bit'."
    exit 1
}

# Install WinRAR
Install-WinRAR -url $url -outputPath $outputPath
