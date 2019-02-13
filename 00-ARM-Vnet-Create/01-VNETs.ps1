$config = Get-Content -Path .\config.json -Raw | ConvertFrom-Json

New-AzResourceGroupDeployment    -TemplateFile ./01-VNETs-template.json -TemplateParameterFile ./01-VNETs-parameters.json -Location uksouth -ResourceGroupName Shared-Services