//Boek getting started with Bicep
param location string = resourceGroup().location
param NamePrefix string = 'stgsecond'
param hotAccessTier bool = true

@allowed([
  'alfa'
  'beta'
  'charlie'
])
@description('Naam mag alleen alfa, beta of charlie zijn')
param storageAccountNameTwo string = 'alfa'

var storageAccountName = '${NamePrefix}${uniqueString(resourceGroup().id)}'

@description('Dit is een storage account deployment.')
resource stg 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: storageAccountName
  //name: storageAccountNameTwo
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  
  properties:{
    accessTier: hotAccessTier ?'Hot':'Cool'
  }
  
}

resource blob 'Microsoft.Storage/storageAccounts/blobServices/containers@2019-06-01' =  {
  
  name:'blob1/default/myblob'
  //name:'${stg.name}/default/myblob'
  dependsOn:[
    stg
  ]
}




output stg string = stg.properties.primaryEndpoints.blob
output message string = 'Deployment succeeded'
output stgname string = stg.name

/*
Powershell code:
  New-AzResourceGroup -Name testrg01 -location CentralUS
  New-AzResourceGroup -Name testrg02 -location CentralUS
  New-AzResourceGroup -Name testrg03 -location CentralUS
  New-AzResourceGroupDeployment -ResourceGroupName testrg01 -TemplateFile .\Tutorial11.bicep
  New-AzResourceGroupDeployment -ResourceGroupName testrg02 -TemplateFile .\Tutorial11.bicep -hotaccesstier $false
  New-AzResourceGroupDeployment -ResourceGroupName testrg03 -TemplateFile .\Tutorial11.bicep -hotaccesstier $true
*/
