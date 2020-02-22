$template = "C:\Users\nepeters\data\arm-template-collection\arm-template-collection\1-priority-work-examples\param-file-validation\azuredeploy.json"
$template2 = "C:\Users\nepeters\data\arm-template-collection\arm-template-collection\1-priority-work-examples\resourceid-function\azuredeploy.json"

Test-AzResourceGroupDeployment -TemplateParameterFile $template2