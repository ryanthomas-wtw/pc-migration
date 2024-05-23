# Config

$rigInstallerUrl = "https://github.com/r-lib/rig/releases/download/latest/rig-windows-latest.exe"

$rstudioVersion = "2024.04.1-748"
$rstudioInstallerUrl = "https://download1.rstudio.org/electron/windows/RStudio-${rstudioVersion}.exe"

$rigInstallerPath = "$env:TEMP/rig-installer.exe"
$rstudioInstallerPath = "$env:TEMP/rstudio-installer.exe"

Write-Host "Installing latest Version of Rig"

Invoke-WebRequest -Uri $rigInstallerUrl -OutFile $rigInstallerPath

Start-Process -Wait -FilePath $rigInstallerPath -ArgumentList "/VERYSILENT /SUPPRESSMSGBOXES"

# Install R versions
# Define an array of R versions
$R_versions = @("4.1.3", "4.2.3", "4.3.3")

# Iterate over the array
foreach ($version in $R_versions) {
    # Install the current R version
    Write-Host "Installing R ${version}"
    rig install $version
}

#Write-Host "Installing all necessary versions of Rtools"
rig add rtools

Write-Host "Installing RStudio v ${rstudioVersion}"
Invoke-WebRequest -Uri $rstudioInstallerUrl -OutFile $rstudioInstallerPath
Start-Process -Wait -FilePath $rstudioInstallerPath -ArgumentList "/S /v/qn "