# Output Template

Deploy an Azure Container Instance running the Hello ACI site and output the public IP address.

## Deployment

Create a resource group and deploy template.

```
az group create --name output-template --location eastus

az group deployment create --name output-template --resource-group output-template --template-file output-template/azuredeploy.json
```

## Output

Standard output.

```
{
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/output-template/providers/Microsoft.Resources/deployments/output-template",
  "location": null,
  "name": "output-template",
  "properties": {
    "correlationId": "9169a799-e9f5-49c0-a990-2e4348e642b0",
    "debugSetting": null,
    "dependencies": [],
    "duration": "PT53.3211958S",
    "mode": "Incremental",
    "onErrorDeployment": null,
    "outputResources": [
      {
        "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/output-template/providers/Microsoft.ContainerInstance/containerGroups/containerGroup1",
        "resourceGroup": "output-template"
      }
    ],
    "outputs": {
      "container-ip": {
        "type": "String",
        "value": "20.185.12.233"
      }
    },
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
    "templateHash": "8607273128505602807",
    "templateLink": null,
    "timestamp": "2019-12-14T15:02:48.260145+00:00"
  },
  "resourceGroup": "output-template",
  "type": "Microsoft.Resources/deployments"
}
```

## Remove Deployment

Remove the deplpyment.

```
az group delete --name output-template --yes --no-wait
```