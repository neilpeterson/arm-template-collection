$resourceFile =  "./raw-resource.csv"
$outPutLocation = "~/Desktop/missing-resources.csv"

# 2015
# $rootSchema = "/Volumes/data/arm-tempalte-related/arm-templates/schema/2015-schema.json"

# 2019
$rootSchema = "/Volumes/data/arm-tempalte-related/arm-templates/schema/2019-schema.json"
$autogenSchema = "/Volumes/data/arm-tempalte-related/arm-templates/schema/2019-autogen.json"

$resources = Import-Csv -Path $resourceFile | Select-Object -First 10

# Create CSV
New-Item $outPutLocation -ItemType File -Force

foreach ($item in $resources) {

    $provider = $item.ResourceType.split('/')[0]
    $resourceName = $item.ResourceType.split('/')[1]
    
    $allApi = ((Get-AzResourceProvider -ProviderNamespace $provider).ResourceTypes | Where-Object ResourceTypeName -eq $resourceName).ApiVersions

    # 2015
    # foreach ($apiVersion in $allApi) {
    #     $string = "https://schema.management.azure.com/schemas/$apiVersion/$provider.json#/resourceDefinitions/$resourceName"

    #     if (Select-String -Path $rootSchema -Pattern $string) {
    #         Add-Content $outPutLocation "$provider/$resourceName,$string,Yes"
    #     } else {
    #         Add-Content $outPutLocation "$provider/$resourceName,$string,No"
    #     }
    # }

    # 2019
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