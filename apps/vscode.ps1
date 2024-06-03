Write-Host "Running vscode.ps1 script"

# Download and install winget
$winget_url ="https://github.com/microsoft/winget-cli/releases/download/v1.7.11261/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
Write-Host "Downloading winget"
Invoke-WebRequest -Uri $winget_url -OutFile ".\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle"
Write-Host "Installing winget"
Add-AppxPackage -Path ".\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle"

Write-Host "Installing VS Code via winget"
winget install -e --id Microsoft.VisualStudioCode

$vsc_extensions = @(
    "bierner.markdown-mermaid",
    "christian-kohler.path-intellisense",
    "eamodio.gitlens",
    "esbenp.prettier-vscode",
    "github.copilot",
    "github.copilot-chat",
    "github.vscode-pull-request-github",
    "mathworks.language-matlab",
    "mohamed-el-fodil-ihaddaden.shinysnip",
    "ms-azuretools.vscode-docker",
    "ms-python.debugpy",
    "ms-python.python",
    "ms-python.vscode-pylance",
    "ms-toolsai.jupyter-keymap",
    "ms-vscode-remote.remote-containers",
    "ms-vscode-remote.remote-wsl",
    "ms-vscode.live-server",
    "ms-vscode.powershell",
    "ms-vscode.vscode-typescript-next",
    "quarto.quarto",
    "rdebugger.r-debugger",
    "reditorsupport.r",
    "usernamehw.errorlens",
    "vscodevim.vim"
)
Write-Host "Installing VS Code Extensions"

foreach($ext in $vsc_extensions) {
    Write-Host "Installing ${ext}"
    code --install-extension $ext
}
