# Linked Template



## Deployment

Create a resource group and deploy template.

```
az group create --name linked-template --location eastus

az group deployment create --name linked-template --resource-group linked-template --template-file linked-template/azuredeploy.json
```

## Output

Standard output.

```

```

## Remove Deployment

Remove the deplpyment.

```
az group delete --name simple-template --yes --no-wait
```