//https://www.youtube.com/watch?v=PFWsQNyzpGo
param location string = 'CentralUS'

module storageModule 'Tutorial8 - storage.bicep' = {
 name: 'storageModule'
 params: {
    storageName: '0509storage'
    location: location
 } 
}
