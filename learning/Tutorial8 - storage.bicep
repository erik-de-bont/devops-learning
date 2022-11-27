//https://www.youtube.com/watch?v=PFWsQNyzpGo

@minLength(3)
@maxLength(11)
param storageName string
param location string

resource storageaccprod 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: storageName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

output storageEndpoint object = storageaccprod.properties.primaryEndpoints
