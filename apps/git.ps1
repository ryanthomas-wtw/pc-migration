# Define the URL for the latest version of Git for Windows
$version="2.45.2"
$url = "https://github.com/git-for-windows/git/releases/download/v${version}.windows.1/Git-${version}-64-bit.exe"

# Define the path where the installer will be saved
$outfile = "$env:TEMP\GitInstaller.exe"

# Download the installer
Invoke-WebRequest -Uri $url -OutFile $outfile

# Run the installer
Start-Process -FilePath $outfile -Args "/VERYSILENT /NORESTART /NOCANCEL /SP- /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS /NOICONS /COMPONENTS=\"icons,ext\reg\shellhere,assoc,assoc_sh\"" -Wait -PassThru

