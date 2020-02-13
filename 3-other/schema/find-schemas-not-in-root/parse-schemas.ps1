# Uber Goal: Identify all resources that have a schema but are not in the root schema
# This is problematic because we have the schema 
# but cannot validate because we do not knwo about the resource version

# Get a list of cached schema files
# Gets the resource provider and API version from schema file name
# Gets all resources from the schema file
# Checks the root schemas for each resource
# Produces a report with that indicates of the resourec was found

$schemaFiles = "~/.local/share/Microsoft/ARMLanguageServer/Schemas/JSON"
$rootSchema = "/Users/neilpeterson/Documents/code/arm-template-collection/schema/root-schemas/2019-schema.json"
$autogenSchema = "/Users/neilpeterson/Documents/code/arm-template-collection/schema/root-schemas/2019-autogen.json"
$outPutLocation = "~/Desktop/resources.csv"

# Get schema file names
if (Test-Path $schemaFiles) {
    $schems = Get-ChildItem $schemaFiles -Filter *.json
} else {
    Write-Output "bad"
}

# Create CSV
New-Item $outPutLocation -ItemType File -Force

# Create empty object
$resourceNames = New-Object System.Collections.Generic.List[System.Object]

# Loop through each Schema file
foreach ($item in $schems) {

    # Get API Version (from file name)
    $apiVersion = ([io.fileinfo]$item).basename.Split('%002F')[4]
    
    # Get resource provider name (from file name)
    $resourceProvider = ([io.fileinfo]$item).basename.Split('%002F')[5]

    # Conver schema JSON to PowerShell Object
    $rpDefinition = get-content $item.FullName | ConvertFrom-Json

    # Get resource names from resource provider schema (PowerShell Object)
    $resources = $rpDefinition.resourceDefinitions | Get-Member -MemberType NoteProperty | Select-Object -ExpandProperty Name | Sort-Object

    foreach ($resource in $resources) {
        # Create a string that can be compared against the root schema and add to array
        $resourceNames.Add("$apiVersion/$resourceProvider.json#/resourceDefinitions/$resource")
    }
}

# Loop through array
foreach ($item2 in $resourceNames) {

    # Trim Resource Name
    $resource = $item2.Split('/')[3]
    $namespace = $item2.Split('/')[1]

    # Search each root level schema for resource
    if (Select-String -Path $rootSchema -Pattern $item2) {
        Add-Content $outPutLocation "$namespace,$resource,$item2,Yes"
    } else {
        if (Select-String -Path $autogenSchema -Pattern $item2) {
            Add-Content $outPutLocation "$namespace,$resource,$item2,Yes"
        } else {
            Add-Content $outPutLocation "$namespace,$resource,$item2,No"
        }
    }
}