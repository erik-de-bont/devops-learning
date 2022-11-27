param location string = resourceGroup().location

resource storage 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: 'subariosstorage12345'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  location: location
}
