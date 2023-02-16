## StorageaccountTests.Tests.ps1

install-module az.storage
import-module az.storage

describe 'Check if storageaccount exists' {

    $storageaccount = 'subariosstorage12345'

    $status = Get-AzStorageAccount -StorageAccountName $storageaccount

    it 'should not exist' {
        $status | Should -Not -Exist 
    }
}