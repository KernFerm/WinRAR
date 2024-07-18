# Define the URL to download WinRAR
$url = "https://www.win-rar.com/fileadmin/winrar-versions/winrar-x64-701.exe"

# Define the output path
$outputPath = "$env:TEMP\winrar-installer.exe"
$logFile = "$env:TEMP\winrar-install.log"

# Function to log messages
function Log-Message {
    param (
        [string]$message,
        [string]$type = "INFO"
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "$timestamp [$type] $message"
    Write-Host $logEntry
    Add-Content -Path $logFile -Value $logEntry
}

# Download the WinRAR installer
try {
    Log-Message "Starting download of WinRAR from $url"
    Invoke-WebRequest -Uri $url -OutFile $outputPath -UseBasicParsing
    Log-Message "Download complete."
} catch {
    Log-Message "Failed to download WinRAR installer: $_" "ERROR"
    exit 1
}

# Verify that the installer exists and is not empty
if (-Not (Test-Path -Path $outputPath) -Or (Get-Item $outputPath).Length -eq 0) {
    Log-Message "Downloaded WinRAR installer is missing or empty." "ERROR"
    exit 1
}

# Run the WinRAR installer silently
try {
    Log-Message "Starting silent installation of WinRAR."
    Start-Process -FilePath $outputPath -ArgumentList "/S" -NoNewWindow -Wait
    Log-Message "WinRAR installation complete."
} catch {
    Log-Message "Failed to install WinRAR: $_" "ERROR"
    exit 1
}

# Clean up the downloaded installer
try {
    Remove-Item -Path $outputPath -Force
    Log-Message "Cleaned up the downloaded installer."
} catch {
    Log-Message "Failed to remove the downloaded installer: $_" "WARNING"
}

# Wait for user input to close the window
Read-Host -Prompt "Press Enter to close"
