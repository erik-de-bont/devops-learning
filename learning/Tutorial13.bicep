//Boek getting started with Bicep - loops
param namePrefix string = 'stg'
param location string = resourceGroup().location
param numberofContainers int = 5

var storageAccountName = '${namePrefix}${uniqueString(resourceGroup().id)}'

resource stg 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  
  properties:{
    accessTier: 'Hot'
  }
  
}

resource blob 'Microsoft.Storage/storageAccounts/blobServices/containers@2019-06-01' = [for i in range(1,numberofContainers):{
  name:'${stg.name}/default/container${i}'
}]

output stg string = stg.name
