# Output Template

Deploy an Azure Container Instance running the Hello ACI site.

## Deployment

Create a resource group and deploy template.

```
az group create --name output-template --location eastus

az group deployment create --resource-group output-template --template-file output-template/azuredeploy.json
```

## Output

Standard output.

```
{
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/simple-template",
  "location": "eastus",
  "managedBy": null,
  "name": "simple-template",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "tags": null,
  "type": "Microsoft.Resources/resourceGroups"
}
Neils-MacBook-Pro:arm-templates neilpeterson$ az group deployment create --name simple-template --resource-group simple-template --template-file simple-template/azuredeploy.json 
{
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/simple-template/providers/Microsoft.Resources/deployments/simple-template",
  "location": null,
  "name": "simple-template",
  "properties": {
    "correlationId": "db329cdb-fed9-4298-b578-650a80c1ca82",
    "debugSetting": null,
    "dependencies": [],
    "duration": "PT1M17.7923116S",
    "mode": "Incremental",
    "onErrorDeployment": null,
    "outputResources": [
      {
        "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/simple-template/providers/Microsoft.ContainerInstance/containerGroups/containerGroup1",
        "resourceGroup": "simple-template"
      }
    ],
    "outputs": {},
    "parameters": {},
    "parametersLink": null,
    "providers": [
      {
        "id": null,
        "namespace": "Microsoft.ContainerInstance",
        "registrationPolicy": null,
        "registrationState": null,
        "resourceTypes": [
          {
            "aliases": null,
            "apiVersions": null,
            "capabilities": null,
            "locations": [
              "eastus"
            ],
            "properties": null,
            "resourceType": "containerGroups"
          }
        ]
      }
    ],
    "provisioningState": "Succeeded",
    "template": null,
    "templateHash": "12799901094269348002",
    "templateLink": null,
    "timestamp": "2019-12-14T14:57:16.965999+00:00"
  },
  "resourceGroup": "simple-template",
  "type": "Microsoft.Resources/deployments"
}
```