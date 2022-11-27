//https://www.youtube.com/watch?v=XytdllxF7vg
@minLength(3)
@maxLength(19)
param stgActNamePrefix string

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
param location string = resourceGroup().location


//var uniqueId = uniqueString(resourceGroup().id, deployment().name)                                            //Stap 1 van 3 - Unieke ID maken van ID van resource group en naam van deployment
//var uniqueIdShort = take(uniqueId, 5)                                                                         //Stap 2 van 3 - 5 karakters pakken van unieke ID
//var stgActName = '${stgActNamePrefix}${uniqueIdShort}'                                                        //Stap 3 van 3 - koppelen beide variabelen
var stgActName = '${stgActNamePrefix}${take (uniqueString(resourceGroup().id, deployment().name), 5)}'      //nested manier



resource storage 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: stgActName
  sku: {
    name: stgactSku
  }
  kind: 'StorageV2'
  location: location
  tags: stgTags
}
