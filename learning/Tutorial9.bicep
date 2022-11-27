//https://www.youtube.com/watch?v=PFWsQNyzpGo
param locationTemplate string = 'CentralUS'

targetScope = 'subscription'

var rgName = 'DeployedFromBicepRG'
resource myNewGroup 'Microsoft.Resources/resourceGroups@2021-04-01'={
  name: rgName
  location: locationTemplate
}


module storageModule 'Tutorial8 - storage.bicep' = {
  name: 'storageModule'
  scope: resourceGroup(myNewGroup.name)
  params: {
     storageName: '0509storage'
     location: locationTemplate
  } 
 }
