$rpSchema = Get-Content -Path "/Users/neilpeterson/.local/share/Microsoft/ARMLanguageServer/Schemas/JSON/https:%002F%002Fschema.management.azure.com%002Fschemas%002F2019-11-01%002FMicrosoft.Network.json" | ConvertFrom-Json

$rpSchema.resourceDefinitions | Get-Member -MemberType NoteProperty | Select-Object -ExpandProperty Name | Sort-Object