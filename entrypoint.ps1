$null = Find-Module -Name Az | Install-Module -Force

$secpasswd = ConvertTo-SecureString $env:SERVICE_PASS -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential ($env:SERVICE_PRINCIPAL, $secpasswd)

Add-AzAccount -ServicePrincipal -Credential $Credential -Tenant $env:TENANT_ID

$location = "eastus"
$rgName = "fredb-rg"
#$planName = "$($env:APPID)-plan"

New-AzResourceGroup -Name $rgName -Location $location -Force
New-AzStorageAccount -Name ddsessfswe332 -Location $location -ResourceGroupName $rgName -SkuName Standard_GRS -Kind StorageV2
#New-AzAppServicePlan -ResourceGroupName $rgName -Name $planName -Location $location
#New-AzWebApp -ResourceGroupName $rgName -Location $location -AppServicePlan $planName -Name $env:APPID

#[xml]$webappProfile = Get-AzWebAppPublishingProfile -Name $env:APPID -ResourceGroupName $rgName
#$msdeploy = $webappProfile.publishData.publishProfile | Where-Object {$_.publishmethod -eq 'MSDeploy'}
#$remote = "https://$($msdeploy.userName):$($msdeploy.userPWD)@${env:APPID}.scm.azurewebsites.net/${env:APPID}.git"
