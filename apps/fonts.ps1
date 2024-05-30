# Define the URL to the Fira Code GitHub release
$url = "https://github.com/tonsky/FiraCode/releases/download/5.2/Fira_Code_v5.2.zip"

# Define the path to the download location
$download_path = ".\Fira_Code_v5.2.zip"

# Download the Fira Code zip file
Invoke-WebRequest -Uri $url -OutFile $download_path

# Extract the zip file
Expand-Archive -Path $download_path -DestinationPath ".\Fira_Code_v5.2"

# Install the fonts
$fonts = Get-ChildItem -Path ".\Fira_Code_v5.2\ttf" -Filter "*.ttf"
foreach ($font in $fonts) {
    # Construct the destination path
    $destination_path = Join-Path -Path "$env:windir\Fonts" -ChildPath $font.Name

    # Copy the font file to the Fonts directory
    Copy-Item -Path $font.FullName -Destination $destination_path
}