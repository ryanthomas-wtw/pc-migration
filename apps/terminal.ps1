# Import the required module
Import-Module -Name PowerShellGet

# Install the Windows Terminal from the Microsoft Store
Install-Script -Name Install-WindowsTerminal -Scope CurrentUser -Force -ErrorAction Stop

# Run the script to install Windows Terminal
Install-WindowsTerminal

# Enable the Windows Subsystem for Linux (WSL)
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# Enable the Virtual Machine Platform
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Set WSL default version to 2
wsl --set-default-version 

# Define the URL for the latest version of Ubuntu 22.10 for WSL

$url = "https://aka.ms/wslubuntu2210"

# Define the path where the installer will be saved
$outfile = "$env:TEMP\Ubuntu2210.appx"

# Download the installer
Invoke-WebRequest -Uri $url -OutFile $outfile

# Install Ubuntu 22.10
Add-AppxPackage -Path $outfile2
