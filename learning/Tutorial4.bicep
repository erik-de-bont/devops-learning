//https://www.youtube.com/watch?v=_yvb6NVx61Y
param location string = resourceGroup().location

@minLength(3)
@maxLength(19)
param name string = 'sasavillscus008'

@allowed([
  'Standard_LRS'
  'Standard_GRS'
  'Standard_RAGRS'
  'Standard_ZRS'
  'Premium_LRS'
  'Premium_ZRS'
  'Standard_GZRS'
])
param type string = 'Standard_LRS'

var containerName = 'images'

resource stacc 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: name
  location: location
  kind: 'StorageV2'
  sku: {
    name: type
  }
}

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-09-01' = {
  name: '${stacc.name}/default/${containerName}'
}

output storageId string = stacc.id
