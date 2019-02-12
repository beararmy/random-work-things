$policiesfolder = "/Users/stefanharrington/Documents/00-Git/random-work-things/WK3 - ARM Artifacts/policies"
$rulesfolder = "/Users/stefanharrington/Documents/00-Git/random-work-things/WK3 - ARM Artifacts/rules"
$parametersfolder = "/Users/stefanharrington/Documents/00-Git/random-work-things/WK3 - ARM Artifacts/parameters"
$appliedRG = "ARM-00"

$PolicyDefinition = @{ 
    Name = "allowed-locations"
    DisplayName = "Allowed locations"
    description = "This policy enables you to restrict the locations your organization can specify when deploying resources. Use to enforce your geo-compliance requirements. Excludes resource groups, Microsoft.AzureActiveDirectory/b2cDirectories, and resources that use the 'global' region."
    Policy = "$rulesfolder/rules-allowed-locations.json"
    Parameter = "$parametersfolder/parameters-allowed-locations.json"
    Mode = 'Indexed'
}

$definition = New-AzPolicyDefinition @PolicyDefinition

$scope = Get-AzResourceGroup -Name $appliedRG

$policyparam = '{ "listOfAllowedLocations": { "value": [ "northeurope", "westeurope" ] } }'

$assignment = New-AzPolicyAssignment -Name 'allowed-locations-assignment' -DisplayName 'Allowed locations Assignment' -Scope $scope.ResourceId -PolicyDefinition $definition -PolicyParameter $policyparam