## StorageaccountTests.Tests.ps1

install-module az | Out-Null
import-module az | Out-Null

describe 'Check if storageaccount exists' {

    $storageaccount = 'subariosstorage12345'

    $status = Get-AzStorageAccount -StorageAccountName $storageaccount

    it 'should not exist' {
        $status | Should -Not -Exist 
    }
}