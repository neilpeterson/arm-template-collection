$schemaFiles = "~/.local/share/Microsoft/ARMLanguageServer/Schemas/JSON"
# $rootSchemaclear = "/Volumes/data/arm-tempalte-related/arm-templates/schema/2019-schema.json"
$rootSchema = "/Volumes/data/arm-tempalte-related/arm-templates/schema/2015-schema.json"
$autogenSchema = "/Volumes/data/arm-tempalte-related/arm-templates/schema/2019-autogen.json"
$outPutLocation = "~/Desktop/resources.csv"

# Get schema file names
if (Test-Path $schemaFiles) {
    $schems = Get-ChildItem $schemaFiles -Filter *.json
} else {
    Write-Output "bad"
}

# Create CSV
New-Item $outPutLocation -ItemType File

# Create empty object
$resourceNames = New-Object System.Collections.Generic.List[System.Object]

foreach ($item in $schems) {

    # Get API Version (from file name)
    $apiVersion = ([io.fileinfo]$item).basename.Split('%002F')[4]
    $resourceProvider = ([io.fileinfo]$item).basename.Split('%002F')[5]
   
    # Resource Names
    $rpDefinition = get-content $item.FullName | ConvertFrom-Json
    $resources = $rpDefinition.resourceDefinitions | Get-Member -MemberType NoteProperty | Select-Object -ExpandProperty Name | Sort-Object

    foreach ($resource in $resources) {
        $resourceNames.Add("$apiVersion/$resourceProvider.json#/resourceDefinitions/$resource")
    }
}

# foreach ($item2 in $resourceNames) {

#     # Trim Resource Name
#     $resource = $item2.Split('/')[3]
#     $namespace = $item2.Split('/')[1]

#     if (Select-String -Path $rootSchema -Pattern $item2) {
#         Add-Content $outPutLocation "$namespace,$resource,$item2,Yes"
#     } else {
#         if (Select-String -Path $autogenSchema -Pattern $item2) {
#             Add-Content $outPutLocation "$namespace,$resource,$item2,Yes"
#         } else {
#             Add-Content $outPutLocation "$namespace,$resource,$item2,No"
#         }
#     }
# }

foreach ($item2 in $resourceNames) {

    # Trim Resource Name
    $resource = $item2.Split('/')[3]
    $namespace = $item2.Split('/')[1]

    if (Select-String -Path $rootSchema -Pattern $item2) {
        Add-Content $outPutLocation "$namespace,$resource,$item2,Yes"
    } else {
        Add-Content $outPutLocation "$namespace,$resource,$item2,No"
    }
}