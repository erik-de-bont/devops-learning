//https://www.youtube.com/watch?v=PFWsQNyzpGo adapted
param prefix string

var locations = [
  'eastus'
  'southeastasia'
  'northeurope'
]

resource storageaccprod 'Microsoft.Storage/storageAccounts@2021-09-01' = if (prefix == 'prod') {
  name: '0509mariosprod'
  location: first(locations)
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

resource storageaccdev 'Microsoft.Storage/storageAccounts@2021-09-01' = if (prefix == 'dev') {
  name: '0509mariosdev'
  location: last(locations)
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
