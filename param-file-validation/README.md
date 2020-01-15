# Output Template

Deploy an Azure Container Instance running the Hello ACI site using a template and paramaters file.

## Deployment

Create a resource group and validate deployment.

```
az group create --name param-file-validate --location eastus

Test-AzResourceGroupDeployment -ResourceGroupName validate -TemplateFile ./param-file-validation/azuredeploy.json -TemplateParameterFile ./param-file-validation/azuredeploy.parameters.
json
```