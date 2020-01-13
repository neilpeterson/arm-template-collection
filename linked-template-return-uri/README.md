# Linked Template Return deployment properties

## Deployment

Create a resource group and deploy template.

```
az group create --name linked-template-return-uri --location eastus

az group deployment create --resource-group linked-template-return-uri --template-file linked-template-return-uri azuredeploy.json
```