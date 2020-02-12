# Takes a list of resoruce providers that have onboarded into schema autogeneration
# Retrieves all API versions for the resource provider using the Get-AzResourceProvider command
# Compare the resource provider / api version combiniataion against root level schema
# Compares the resource provider / api version agains schema files

# https://schema.management.azure.com/schemas/2015-12-01/Microsoft.Batch.json#/resourceDefinitions/batchAccounts

$autogenListfile = "./autogen-list.json"

# Get list of onboarded resource providers
$autogenList = Get-Content $autogenListfile | ConvertFrom-Json

foreach ($item in $autogenList) {

    # Get a lst of apiVersion for the resource
    $namespace = $item.namespace
    $resources = Get-AzResourceProvider -ProviderNamespace $namespace
    
    foreach ($resource in $resources) {
        $name = $resource.ResourceTypes.ResourceTypeName
        write-output $resource

    #     $apiVersions = ((Get-AzResourceProvider -ProviderNamespace $item.namespace).ResourceTypes | Where-Object ResourceTypeName -eq $name).ApiVersions

    #     foreach ($apiVersion in $apiVersions) {
    #         write-output "https://schema.management.azure.com/schemas/$apiVersion/$namespace.json"
    #     }
    }
}