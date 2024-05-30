# Define the URLs for the installers
$azureStorageExplorerUrl = "https://go.microsoft.com/fwlink/?LinkId=708343&clcid=0x409"
$sqlServerManagementStudioUrl = "https://aka.ms/ssmsfullsetup"

# Define the paths where the installers will be saved
$azureStorageExplorerInstallerPath = "$env:TEMP\AzureStorageExplorerInstaller.exe"
$sqlServerManagementStudioInstallerPath = "$env:TEMP\SQLServerManagementStudioInstaller.exe"

# Download the Azure Storage Explorer installer
Invoke-WebRequest -Uri $azureStorageExplorerUrl -OutFile $azureStorageExplorerInstallerPath

# Download the SQL Server Management Studio installer
Invoke-WebRequest -Uri $sqlServerManagementStudioUrl -OutFile $sqlServerManagementStudioInstallerPath

# Run the Azure Storage Explorer installer
#Start-Process -FilePath $azureStorageExplorerInstallerPath -Wait

# Run the SQL Server Management Studio installer
#Start-Process -FilePath $sqlServerManagementStudioInstallerPath -Wait