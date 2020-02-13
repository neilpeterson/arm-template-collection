# Output Template

Deploy an Azure Container Instance running the Hello ACI site using a template and paramaters file.

## Deployment

Create a resource group and validate deployment.

```
az group create --name param-file-validate --location eastus

az group deployment create --resource-group param-file-validate --template-file param-file-validation/azuredeploy.json --parameters param-file-validation/azuredeploy.parameters.json
```