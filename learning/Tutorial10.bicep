//https://www.youtube.com/watch?v=gt19-J7GcEY

module fullname 'Tutorial10 - sample.bicep' = {
  name: 'Mario'
  params: {
    FirstName: 'Mario'
    MiddleName: 'Sebastiaan'
    LastName: 'Berend'
  }

}

output name string = fullname.outputs.Fullname
