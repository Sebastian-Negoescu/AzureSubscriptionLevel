######################
### LOGIN TO AZURE ###
######################

$pwd = Read-Host "Input your AzDevOps SP's Password..." -AsSecureString
$creds = New-Object System.Management.Automation.PSCredential("http://AzDevOps", $pwd)
$tenant = "sebinego.onmicrosoft.com"
Connect-AzAccount -ServicePrincipal -Credential $creds -Tenant $tenant -Subscription "VSEnterprise_DEV"

Test-AzDeployment -Location "westeurope" -TemplateUri "https://raw.githubusercontent.com/Sebastian-Negoescu/AzureSubscriptionLevel/master/master_sample.json" -TemplateParameterUri "https://raw.githubusercontent.com/Sebastian-Negoescu/AzureSubscriptionLevel/master/master_sample.parameters.json"
If ($?) {
    New-AzDeployment -Location "westeurope" -TemplateUri "https://raw.githubusercontent.com/Sebastian-Negoescu/AzureSubscriptionLevel/master/master_sample.json" -TemplateParameterUri "https://raw.githubusercontent.com/Sebastian-Negoescu/AzureSubscriptionLevel/master/master_sample.parameters.json"
}