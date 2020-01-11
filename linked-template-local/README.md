# Linked Template



## Deployment

Create a resource group and deploy template.

```
az group create --name linked-template --location eastus

az group deployment create --resource-group linked-template --template-file linked-template-simple/azuredeploy.json
```

## Output

Standard output.

```
{
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/linked-template/providers/Microsoft.Resources/deployments/azuredeploy",
  "location": null,
  "name": "azuredeploy",
  "properties": {
    "correlationId": "b63e940e-791a-4054-a83c-46fea0607be5",
    "debugSetting": null,
    "dependencies": [
      {
        "dependsOn": [
          {
            "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/linked-template/providers/Microsoft.Resources/deployments/vote-database",
            "resourceGroup": "linked-template",
            "resourceName": "vote-database",
            "resourceType": "Microsoft.Resources/deployments"
          }
        ],
        "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/linked-template/providers/Microsoft.Resources/deployments/vote-frontend",
        "resourceGroup": "linked-template",
        "resourceName": "vote-frontend",
        "resourceType": "Microsoft.Resources/deployments"
      }
    ],
    "duration": "PT10M28.2874726S",
    "mode": "Incremental",
    "onErrorDeployment": null,
    "outputResources": [
      {
        "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/linked-template/providers/Microsoft.ContainerInstance/containerGroups/azure-vote",
        "resourceGroup": "linked-template"
      },
      {
        "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/linked-template/providers/Microsoft.DocumentDB/databaseAccounts/vote-database",
        "resourceGroup": "linked-template"
      }
    ],
    "outputs": null,
    "parameters": {},
    "parametersLink": null,
    "providers": [
      {
        "id": null,
        "namespace": "Microsoft.Resources",
        "registrationPolicy": null,
        "registrationState": null,
        "resourceTypes": [
          {
            "aliases": null,
            "apiVersions": null,
            "capabilities": null,
            "locations": [
              null
            ],
            "properties": null,
            "resourceType": "deployments"
          }
        ]
      }
    ],
    "provisioningState": "Succeeded",
    "template": null,
    "templateHash": "3106870816193825896",
    "templateLink": null,
    "timestamp": "2019-12-17T01:07:02.330267+00:00"
  },
  "resourceGroup": "linked-template",
  "type": "Microsoft.Resources/deployments"
}
```

## Remove Deployment

Remove the deplpyment.

```
az group delete --name linked-template --yes --no-wait
```