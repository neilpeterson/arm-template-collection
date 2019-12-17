# Output Template

Deploy an Azure Container Instance running the Hello ACI site using a template and paramaters file.

## Deployment

Create a resource group and deploy template.

```
az group create --name param-file-template --location eastus

az group deployment create --resource-group param-file-template --template-file param-file-template/azuredeploy.json --parameters param-file-template/azuredeploy.parameters.json
```

## Output

Standard output.

```
{
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/param-file-template/providers/Microsoft.Resources/deployments/output-template",
  "location": null,
  "name": "output-template",
  "properties": {
    "correlationId": "1e0475af-acce-429f-9ee4-4159e4e4d513",
    "debugSetting": null,
    "dependencies": [],
    "duration": "PT1M58.5281778S",
    "mode": "Incremental",
    "onErrorDeployment": null,
    "outputResources": [
      {
        "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/param-file-template/providers/Microsoft.ContainerInstance/containerGroups/containerGroup1",
        "resourceGroup": "param-file-template"
      }
    ],
    "outputs": {},
    "parameters": {
      "containerName": {
        "type": "String",
        "value": "helloaci"
      },
      "image": {
        "type": "String",
        "value": "mcr.microsoft.com/azuredocs/aci-helloworld"
      }
    },
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
    "templateHash": "15387253809776130252",
    "templateLink": null,
    "timestamp": "2019-12-16T17:01:19.271091+00:00"
  },
  "resourceGroup": "param-file-template",
  "type": "Microsoft.Resources/deployments"
}
```

## Remove Deployment

Remove the deplpyment.

```
az group delete --name param-file-template --yes --no-wait
```