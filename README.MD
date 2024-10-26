## Support the Project ⭐

If you find this project useful, please give it a star! Your support is appreciated and helps keep the project growing. 🌟


# 📦 WinRAR Auto-Installer Script

This **PowerShell script** automates the process of **downloading**, **installing**, and adding **WinRAR** to the system PATH on Windows machines 🪟.

---

## 📥 How to Download the Repo (First-Time Users)

Click the link to read [**Instructions**](https://www.gitprojects.fnbubbles420.org/how-to-download-repos) 📄.

---

## ✨ Features

- **Automated Download**: Downloads the WinRAR installer directly from the official website 🌐.
- **Silent Installation**: Installs WinRAR silently without requiring user interaction 🛠️.
- **PATH Update**: Adds the WinRAR installation directory to the system PATH, allowing WinRAR commands to be run from anywhere in the command line ✅.

---

# 🛠️ WinRAR Silent Installer Script - Logging Information

This script includes **robust logging** mechanisms to ensure detailed tracking of the script's operations and for troubleshooting 🔍.

### 📝 Logging

- The script logs all actions and errors to a file named `winrar-install.log` located in the **temporary directory**.

### 📁 Log File Location

The log file is saved in the user's temporary directory. The typical path is:
`C:\Users<YourUsername>\AppData\Local\Temp\winrar-install.log`

### 🛠️ Log-Message Function

The script includes a custom function `Log-Message` to handle logging. This function logs messages with a timestamp and a message type (INFO, ERROR, or WARNING).

#### Log-Message Function Definition

```
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

- **message:** The message to log.
- **type:** The type of message (INFO, ERROR, WARNING). Default is "INFO".

### 📊 Example Log Entries

- **Info Message:**
```
2024-07-18 14:32:01 [INFO] Starting download of WinRAR from https://www.win-rar.com/fileadmin/winrar-versions/winrar-x64-701.exe
```

- **Error Message:
```
2024-07-18 14:32:45 [ERROR] Failed to download WinRAR installer: Exception calling "Invoke-WebRequest" with "2" argument(s): "The remote server returned an error: (404) Not Found."
```

- **Warning Message:**
```
2024-07-18 14:33:10 [WARNING] Failed to remove the downloaded installer: Exception calling "Remove-Item" with "1" argument(s): "Cannot find path 'C:\Users\User\AppData\Local\Temp\winrar-installer.exe' because it does not exist."
```

### 🛠️ Logging Steps in the Script

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

4. **Starting Installation:** Logs the beginning of the installation process.
```
Log-Message "Starting silent installation of WinRAR."
```

5. **Installation Complete:** Logs the completion of the installation.
```
Log-Message "WinRAR installation complete."
```

6. **Clean Up:** Logs the removal of the downloaded installer.
```
Log-Message "Cleaned up the downloaded installer."
```

### ⚙️ Prerequisites

- **PowerShell 5.0 or higher** 🖥️.
- **Internet connection** to download the installer 🌐.
- **Administrative privileges** to install and update the system PATH 🔒.

---

### 🔧 v7.4.6 Release of PowerShell - Latest (recommended)

Select the version that matches your system specs:

- For **Windows 64-bit systems**: [Download 64-Bit Installer](https://github.com/PowerShell/PowerShell/releases/download/v7.4.6/PowerShell-7.4.6-win-x64.msi)
- For **Windows 32-bit systems**: [Download 32-Bit Installer](https://github.com/PowerShell/PowerShell/releases/download/v7.4.6/PowerShell-7.4.6-win-x86.msi)

### 🚀 Usage

1. **Open PowerShell (Run as Admin)** 🔒.
2. Navigate to the directory containing the script using `cd`.
3. Run the script:

   ```
   .\WinRAR-7.01-auto-installer.ps1
   ```

4. The script will handle the rest, providing output messages to indicate progress and completion status.

### ❓ If Usage Fails

If the script doesn't run, change the execution policy by running:
```
Set-ExecutionPolicy Bypass -Scope Process
```
- if a message pops up `red` type `Y` click enter.

Then, run the script again without closing PowerShell.

   ```
   .\WinRAR-7.01-auto-installer.ps1
   ```

### 🛠️ How It Works

1. **Download**: The script starts by downloading the **WinRAR installer** using `Invoke-WebRequest`.
2. **Install**: After downloading, it proceeds to install **WinRAR silently** using the `/S` switch.
3. **PATH Update**: Finally, it checks if WinRAR's installation path is in the system PATH. If not, it adds it, allowing WinRAR commands to be run from the command line.

---

### 📝 Note

This script is for **educational purposes** and should be used responsibly. Ensure you have the right to install software on your machine ⚠️.

---

### 📜 License

This script is provided "as is", without warranty of any kind, express or implied. Use it at your own risk.
