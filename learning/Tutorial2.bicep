//https://www.youtube.com/watch?v=NoUyJYVsK2s
param location string = resourceGroup().location
@minLength(3)
@maxLength(24)
param stgActName string

@allowed([
  'Standard_LRS'
  'Standard_GRS'
  'Standard_RAGRS'
  'Standard_ZRS'
  'Premium_LRS'
  'Premium_ZRS'
  'Standard_GZRS'
])
param stgactSku string = 'Standard_LRS'

param stgTags object = {
  Environment: 'Lab'
  Dept: 'IT'
}


resource storage 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: stgActName
  sku: {
    name: stgactSku
  }
  kind: 'StorageV2'
  location: location
  tags: stgTags
}
