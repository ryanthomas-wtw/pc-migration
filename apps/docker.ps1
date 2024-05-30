# Define the URL for the latest version of Docker Desktop
$url = "https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe"

# Define the path where the installer will be saved
$outfile = "$env:TEMP\DockerDesktopInstaller.exe"

# Download the installer
Invoke-WebRequest -Uri $url -OutFile $outfile

# Run the installer
Start-Process -FilePath $outfile -Wait -PassThru