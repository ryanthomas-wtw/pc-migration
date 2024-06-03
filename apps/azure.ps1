Write-Host "Running Azure.ps1"
# Define the URLs for the installers
$azureStorageExplorerUrl = "https://go.microsoft.com/fwlink/?LinkId=708343&clcid=0x409"
$sqlServerManagementStudioUrl = "https://aka.ms/ssmsfullsetup"

# Define the paths where the installers will be saved
$azureStorageExplorerInstallerPath = "$env:TEMP\AzureStorageExplorerInstaller.exe"
$sqlServerManagementStudioInstallerPath = "$env:TEMP\SQLServerManagementStudioInstaller.exe"

# Download the Azure Storage Explorer installer
Write-Host "Downloading Azure Storage Explorer"
Invoke-WebRequest -Uri $azureStorageExplorerUrl -OutFile $azureStorageExplorerInstallerPath

# Run the Azure Storage Explorer installer
Write-Host "Install Azure Storage Explorer"
Start-Process -FilePath $azureStorageExplorerInstallerPath -Wait

# Download the SQL Server Management Studio installer
Write-Host "Downloading SQL Server Management Studio"
Invoke-WebRequest -Uri $sqlServerManagementStudioUrl -OutFile $sqlServerManagementStudioInstallerPath

# Run the SQL Server Management Studio installer
Write-Host "Installing SQL Server Management Studio"
Start-Process -FilePath $sqlServerManagementStudioInstallerPath -Wait