## StorageaccountTests.Tests.ps1

Install-Module az -force 
Import-Module az

describe "Check if storageaccount exists" {

    $storageAccountName = 'subariosstorage12345' 
    $storageAccount = Get-AzStorageAccount -StorageAccountName $storageAccountName

    it "StorageAccount $storageAccountName should not exist" {
        $storageAccount | Should Not be $null
    }
}
