
```
az group create --name linked-template-local --location eastus

az group deployment create --resource-group linked-template-local --template-file linked-template-local/azuredeploy.json
az group deployment create --resource-group linked-template-local --template-uri https://raw.githubusercontent.com/neilpeterson/arm-template-collection/master/linked-template-local/azuredeploy.json
```