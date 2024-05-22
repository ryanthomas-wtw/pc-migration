# Define an array of script names
$script_names = @(
    "rig.ps1", 
    "vscode.ps1", 
    "terminal.ps1"
    )

# Iterate over the array
foreach ($script in $script_names) {
    # Construct the full path to the script
    $script_path = Join-Path -Path ".\apps" -ChildPath $script

    # Run the script
    & $script_path
}