<#PSScriptInfo

.VERSION 1.0.0

.AUTHOR Microsoft

.COMPANYNAME Microsoft Corporation

.COPYRIGHT (c) Microsoft Corporation

#>

<#
.SYNOPSIS
    A super simple script to install VS Code and the ARM Template tools during an Azure VM Deployment. 
    For a more complete / customizable installaton script see:
    https://github.com/PowerShell/vscode-powershell/blob/master/scripts/Install-VSCode.ps1
#>

New-Item -ItemType Directory c:\temp\ 

Invoke-WebRequest https://vscode-update.azurewebsites.net/latest/win32-x64/stable -OutFile c:\temp\vscode.exe

Start-Process c:\temp\vscode.exe -ArgumentList /silent

Invoke-WebRequest https://github.com/microsoft/vscode-azurearmtools/releases/download/v0.8.3/azurerm-vscode-tools-0.8.3.vsix -OutFile c:\temp\azurerm-vscode-tools-0.8.3.vsix

& code --install-extension c:\temp\azurerm-vscode-tools-0.8.3.vsix