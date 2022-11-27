//Boek getting started with Bicep
param location string = resourceGroup().location
param blobContainerNames array = [
  'bicep'
  'simply'
  'rules'
]

var storageAccountName = 'mariosstorageaccount123'

@description('Dit is een storage account deployment.')
resource stg 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

resource blob 'Microsoft.Storage/storageAccounts/blobServices/containers@2019-06-01' = [for blobContainerName in blobContainerNames: {
  name:'${stg.name}/default/${blobContainerName}'
}]
