# Define the URL to download WinRAR
$url = "https://www.win-rar.com/fileadmin/winrar-versions/winrar-x64-701.exe"

# Define the output path
$outputPath = "$env:TEMP\winrar-installer.exe"

# Download the WinRAR installer
try {
    Invoke-WebRequest -Uri $url -OutFile $outputPath -UseBasicParsing
    Write-Host "Download complete."
} catch {
    Write-Error "Failed to download WinRAR installer."
    exit 1
}

# Run the WinRAR installer silently
try {
    Start-Process -FilePath $outputPath -ArgumentList "/S" -Wait
    Write-Host "WinRAR installation complete."
} catch {
    Write-Error "Failed to install WinRAR."
    exit 1
}

# Wait for user input to close the window
Read-Host -Prompt "Press Enter to close"


