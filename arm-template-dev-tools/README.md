# Output Template

Deploy an Azure VM with VS Code and all extensions needed for ARM Tempalte development.

## Deployment

Create a resource group and deploy template.

```
az group create --name arm-template-dev-vm --location eastus

az group deployment create --resource-group arm-template-dev-vm --template-file arm-template-dev-vm/azuredeploy.json
```

## Output

Standard output.

```
```