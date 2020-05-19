######################
### LOGIN TO AZURE ###
######################

$pwd = Read-Host "Input your AzDevOps SP's Password..." -AsSecureString
$creds = New-Object System.Management.Automation.PSCredential("http://AzDevOps", $pwd)
$tenant = "sebinego.onmicrosoft.com"
Connect-AzAccount -ServicePrincipal -Credential $creds -Tenant $tenant -Subscription "VSEnterprise_DEV"

Test-AzDeployment -Location "westeurope" -TemplateUri "https://raw.githubusercontent.com/Sebastian-Negoescu/AzureSubscriptionLevel/master/create_governance.json" -TemplateParameterUri "https://raw.githubusercontent.com/Sebastian-Negoescu/AzureSubscriptionLevel/master/create_governance.parameters.json"
If ($?) {
    New-AzDeployment -Location "westeurope" -TemplateUri "https://raw.githubusercontent.com/Sebastian-Negoescu/AzureSubscriptionLevel/master/create_governance.json" -TemplateParameterUri "https://raw.githubusercontent.com/Sebastian-Negoescu/AzureSubscriptionLevel/master/create_governance.parameters.json"
}