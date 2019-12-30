Invoke-WebRequest https://vscode-update.azurewebsites.net/latest/win32-x64/stable -OutFile c:\temp\vscode.exe

Start-Process c:\temp\vscode.exe -ArgumentList /silent