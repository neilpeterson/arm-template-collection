
```
az group create --name linked-template-local --location eastus

az group deployment create --resource-group linked-template-local --template-file linked-template-local/azuredeploy.json
```