# Output Template

Deploy an Azure VM with VS Code and all extensions needed for ARM Template development.

## Deployment

Create a resource group and deploy template.

```
az group create --name arm-template-dev-tools-eight --location eastus

az group deployment create --resource-group arm-template-dev-tools-eight --template-file arm-template-dev-tools/azuredeploy.json
```

## Output

Standard output.

```
```
