param storageName string
param stSku string = 'Standard_LRS'
param stType string = 'StorageV2'
param stLocation string ='westeurope'


resource obStorage 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  name: storageName
  location: stLocation
  tags: resourceGroup().tags
  sku: {
    name: stSku
    tier: 'Standard'
  }
  kind: stType
  properties: {
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly: true
    accessTier: 'Hot'
    defaultToOAuthAuthentication: true
    networkAcls: {
      defaultAction: 'Deny'
      bypass: 'None'
    }
  }
}
