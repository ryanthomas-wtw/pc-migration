# Download rig
Write-Host "Installing latest Version of Rig"

Invoke-WebRequest -Uri "https://github.com/r-lib/rig/releases/download/latest/rig-windows-latest.exe" -OutFile "rig-installer.exe"


Start-Process -Wait -FilePath rig-installer.exe -Argument "/silent" -PassThru

# Install R versions
# Define an array of R versions
$R_versions = @("4.1.3", "4.2.3", "4.3.3")

# Iterate over the array
foreach ($version in $R_versions) {
    # Install the current R version
    Write-Host "Installing R ${version}"
    rig install $version
}

Write-Host "Installing all necessary versions of Rtools"
rig add rtools