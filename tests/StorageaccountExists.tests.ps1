## StorageaccountTests.Tests.ps1

Install-Module az.storage -force 
Import-Module az.storage

describe "Check if storageaccount exists" {

    $storageAccountName = 'subariosstorage12345' 
    $storageAccount = Get-AzStorageAccount -StorageAccountName $storageAccountName

    it "StorageAccount $storageAccountName should not exist" {
        $storageAccount | Should Not be $null
    }
}
