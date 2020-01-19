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

Start-Process c:\temp\vscode.exe -ArgumentList "/verysilent /tasks=addtopath" -Wait

Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

find-module az | install-module -force

Get-AzVM

# $storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName

# $storageAccountKeys = Get-AzStorageAccountKey -ResourceGroupName $resourceGroupName -Name $storageAccountName

# Invoke-Expression -Command ("cmdkey /add:$([System.Uri]::new($storageAccount.Context.FileEndPoint).Host) " + "/user:AZURE\$($storageAccount.StorageAccountName) /pass:$($storageAccountKeys[0].Value)")