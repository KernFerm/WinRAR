# Check if running with administrator privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "Please run this script as an administrator to install WinRAR and modify PATH."
    exit 1
}

# Define URLs and paths
$url = "https://www.rarlab.com/rar/wrar701.exe"
$outputPath = "$env:TEMP\wrar701.exe"

# Step 1: Download WinRAR installer
Write-Output "Downloading WinRAR installer..."
Invoke-WebRequest -Uri $url -OutFile $outputPath -UseBasicParsing

# Wait for download to complete
Start-Sleep -Seconds 5

# Check if the installer file exists
if (Test-Path $outputPath) {
    Write-Output "WinRAR installer downloaded successfully."
} else {
    Write-Error "Failed to download WinRAR installer."
    exit 1
}

# Step 2: Install WinRAR silently
Write-Output "Installing WinRAR..."
$installArgs = "/S"
Start-Process -FilePath $outputPath -ArgumentList $installArgs -Wait

# Check if WinRAR installed correctly
if (!(Get-Command "WinRAR" -ErrorAction SilentlyContinue)) {
    Write-Error "WinRAR installation failed."
    exit 1
} else {
    Write-Output "WinRAR installed successfully."
}

# Step 3: Add WinRAR to PATH if not already added
Write-Output "Adding WinRAR to PATH..."

# Get WinRAR installation path
$winrarPath = (Get-Command "WinRAR").Path | Split-Path -Parent

# Check if WinRAR path is already in PATH
$currentPath = [Environment]::GetEnvironmentVariable("Path", "Machine")
if (-not ($currentPath -like "*$winrarPath*")) {
    [Environment]::SetEnvironmentVariable("Path", "$winrarPath;$currentPath", "Machine")
    Write-Output "WinRAR path added to PATH."
} else {
    Write-Output "WinRAR is already in PATH."
}

Write-Output "WinRAR installation and PATH configuration completed."
