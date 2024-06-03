Write-Host "Running docker.ps1 script"
# Define the URL for the latest version of Docker Desktop
$url = "https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe"

# Define the path where the installer will be saved
$outfile = "$env:TEMP\DockerDesktopInstaller.exe"

# Download the installer
Write-Host "Downloading Docker Desktop"
Invoke-WebRequest -Uri $url -OutFile $outfile

# Run the installer
Write-Host "Installing Docker Desktop"
Start-Process -FilePath $outfile -Wait -PassThru