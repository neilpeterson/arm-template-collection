$resourceFile =  "./raw-resource.csv"
$outPutLocation = "./missing-resources.csv"

# 2019
$rootSchema = "../root-schemas/2019-schema.json"
$autogenSchema = "../root-schemas/2019-autogen.json"

# Create Output
New-Item $outPutLocation -ItemType File -Force

# Get resource list top used (kusto data)
$resources = Import-Csv -Path $resourceFile | Select-Object -First 50

# Loop through each resource
foreach ($item in $resources) {

    # Get resource / provider name
    $provider = $item.ResourceType.split('/')[0]
    $resourceName = $item.ResourceType.split('/')[1]
    
    # Get a lst of apiVersion for the resource
    $allApi = ((Get-AzResourceProvider -ProviderNamespace $provider).ResourceTypes | Where-Object ResourceTypeName -eq $resourceName).ApiVersions

    # For each apiVersion check root schemas (both 2019 and autogen)
    foreach ($apiVersion in $allApi) {
        $string = "https://schema.management.azure.com/schemas/$apiVersion/$provider.json#/resourceDefinitions/$resourceName"

        if (Select-String -Path $rootSchema -Pattern $string) {
            Add-Content $outPutLocation "$provider/$resourceName,$string,Yes"
        } else {
            if (Select-String -Path $autogenSchema -Pattern $string) {
                Add-Content $outPutLocation "$provider/$resourceName,$string,Yes"
            } else {
                Add-Content $outPutLocation "$provider/$resourceName,$string,No"
            }   
        }
    }
}