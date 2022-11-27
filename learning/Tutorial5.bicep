//https://www.youtube.com/watch?v=PFWsQNyzpGo
param stgActName string
param stgactSku string = 'Standard_LRS'

var locations = [
  'eastus'
  'southeastasia'
  'northeurope'
]

resource storage 'Microsoft.Storage/storageAccounts@2021-09-01' = [for (location,i) in locations: {
  name: '${stgActName}${i}'
  sku: {
    name: stgactSku
  }
  kind: 'StorageV2'
  location: location
}]
