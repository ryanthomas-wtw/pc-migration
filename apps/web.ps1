
Write-Host "Running web.ps1 script"
Write-Host "Downloading Firefox"
# Define the URL for the latest version of Firefox
$url = "https://download.mozilla.org/?product=firefox-latest&os=win&lang=en-US"

# Define the path where the installer will be saved
$outfile = "$env:TEMP\FirefoxSetup.exe"

# Download the installer
Invoke-WebRequest -Uri $url -OutFile $outfile

Write-Host "Installing Firefox"
# Run the installer
Start-Process -FilePath $outfile -Args "/S" -Wait -PassThru

Write-Host "Downloading Postman"
# Define the URL for the latest version of Postman
$url = "https://dl.pstmn.io/download/latest/win64"

# Define the path where the installer will be saved
$outfile = "$env:TEMP\PostmanSetup.exe"

# Download the installer
Invoke-WebRequest -Uri $url -OutFile $outfile

Write-Host "Installing Postman"
# Run the installer
Start-Process -FilePath $outfile -Wait -PassThru