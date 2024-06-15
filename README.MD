# WinRAR Auto-Installer Script

This PowerShell script automates the process of downloading, installing, and adding WinRAR to the system PATH on Windows machines.

## Features

- **Automated Download**: Downloads the WinRAR installer directly from the official website.
- **Silent Installation**: Installs WinRAR silently without requiring user interaction.
- **PATH Update**: Adds the WinRAR installation directory to the system PATH if it's not already present, allowing WinRAR commands to be run from anywhere in the command line.

## Prerequisites

- PowerShell 5.0 or higher
- Internet connection to download the installer
- Administrative privileges for installation and updating the system PATH

## Usage

1. Open PowerShell as an Administrator.
2. Navigate to the directory containing the script.
3. Run the script:
   ```powershell
   .\WinRAR-7.01-auto-installer.ps1
   ```
4. The script will handle the rest, providing output messages to indicate progress and completion status.

## How It Works

1. **Download**: The script starts by downloading the WinRAR installer using the `Invoke-WebRequest` cmdlet. It then waits for 5 seconds to ensure the download completes.
2. **Install**: After downloading, it proceeds to install WinRAR silently using the `/S` switch. It checks if WinRAR is installed correctly by attempting to locate the WinRAR command.
3. **PATH Update**: Finally, it checks if WinRAR's installation path is in the system PATH. If not, it adds it. This allows WinRAR commands to be run from anywhere in the command line.

## Note

This script is designed for educational purposes and should be used responsibly. Ensure you have the right to install software on the machine.

## License

This script is provided "as is", without warranty of any kind, express or implied. Use it at your own risk.
