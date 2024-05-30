# Define an array of script names
$script_names = @(
    "azure.ps1",
    "docker.ps1"
    "rstats.ps1", 
    "vscode.ps1", 
    "terminal.ps1",
    "web.ps1"
    )

# Iterate over the array
foreach ($script in $script_names) {
    # Construct the full path to the script
    $script_path = Join-Path -Path ".\apps" -ChildPath $script

    # Run the script
    & $script_path
}