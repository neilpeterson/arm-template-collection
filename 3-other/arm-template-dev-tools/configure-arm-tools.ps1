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

param (
    [string]$resourceGroupName,
    [string]$storageAccountName
)

# Install VS Code
New-Item -ItemType Directory c:\temp\ 
Invoke-WebRequest https://vscode-update.azurewebsites.net/latest/win32-x64/stable -OutFile c:\temp\vscode.exe
Start-Process c:\temp\vscode.exe -ArgumentList "/verysilent /tasks=addtopath" -Wait

# Install Az PowerShell Module
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
find-module az | install-module -force

# Create File Share
$storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName
$storageAccountKeys = Get-AzStorageAccountKey -ResourceGroupName $resourceGroupName -Name $storageAccountName
$fileShare = New-AzStorageShare -Context $storageAccount.Context -Name vsix-files



Invoke-Expression -Command ("cmdkey /add:$([System.Uri]::new($storageAccount.Context.FileEndPoint).Host) " + "/user:AZURE\$($storageAccount.StorageAccountName) /pass:$($storageAccountKeys[0].Value)")
# $fileShare = Get-AzStorageShare -Context $storageAccount.Context | Where-Object { 
#     $_.Name -eq $fileShareName -and $_.IsSnapshot -eq $false
# }
$password = ConvertTo-SecureString -String $storageAccountKeys[0].Value -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential -ArgumentList "AZURE\$($storageAccount.StorageAccountName)", $password
New-PSDrive -Name V -PSProvider FileSystem -Root "\\$($fileShare.StorageUri.PrimaryUri.Host)\$($fileShare.Name)" -Credential $credential -Persist