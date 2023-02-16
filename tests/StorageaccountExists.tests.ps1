## StorageaccountTests.Tests.ps1

install-module azure.service -Force
import-module azure.service

describe "Check if storageaccount exists" {

    $storageAccountName = 'subariosstorage12345'

    $status = Test-AzureName -Storage $storageAccountName



    it "StorageAccount $storageAccount should not exist" {
        $status | Should be $false
    }
}
