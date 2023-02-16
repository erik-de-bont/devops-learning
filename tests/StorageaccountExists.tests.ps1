## StorageaccountTests.Tests.ps1

import-module az.storage

describe 'Check if storageaccount exists' {

    $storageaccount = 'subariosstorage12345'

    $status = Get-AzStorageAccount -StorageAccountName $storageaccount

    it 'should not exist' {
        $status | Should -Not -Exist 
    }
}