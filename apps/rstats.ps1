# Config
Write-Host "Running rstats.ps1 script"
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

$rprofile_source = "..\settings\R\Rprofile.site"
$renviron_source = "..\settings\R\Renviron.site"

# Iterate over the array
foreach ($version in $R_versions) {
    # Install the current R version
    Write-Host "Installing R ${version}"
    rig install $version
    Write-Host "Copying Global Rprofile and Renviron files to R-${vervion}/etc"
    $rprofile_dest = "C:\Program Files\R\R-${version}\etc\Rprofile.site"
    $renviron_dest = "C:\Program Files\R\R-${version}\etc\Renviron.site"
    # copy Rprofile.site
    Copy-Item -Path $rprofile_source -Destination $rprofile_dest -Force
    
    # concat Renviron.site
    $content1 = Get-Content -Path $renviron_source
    $content2 = Get-Content -Path $renviron_dest
    Set-Content -Path $renviron_dest, -Value $content1, $content2    
}

#Write-Host "Installing all necessary versions of Rtools"
rig add rtools

Write-Host "Installing RStudio v ${rstudioVersion}"
Invoke-WebRequest -Uri $rstudioInstallerUrl -OutFile $rstudioInstallerPath
Start-Process -Wait -FilePath $rstudioInstallerPath -ArgumentList "/S /v/qn "