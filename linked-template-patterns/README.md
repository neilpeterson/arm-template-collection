```
az group create --name linked-tempalte-pattern --location eastus

az group deployment create --resource-group linked-tempalte-pattern --template-uri https://raw.githubusercontent.com/neilpeterson/arm-template-collection/mas
ter/linked-template-patterns/azuredeploy.json

https://marketplace.visualstudio.com/items?itemName=bencoleman.armview