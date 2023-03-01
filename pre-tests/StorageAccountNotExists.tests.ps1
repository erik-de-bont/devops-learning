## StorageaccountNotExists.Tests.ps1

Describe "Test if Azure Storage Account does not exist" {

    BeforeAll {
    $storageAccountName = "subariosstorage12345"
    $storageAccount = Get-AzStorageAccount -ResourceGroupName $ENV:resourceGroupName -StorageAccountName $storageAccountName -ErrorAction SilentlyContinue
    }

    Context "Check if storageaccount exists" {

        It "$storageAccountName should not exist" {
            $storageAccount | Should -BeNullOrEmpty
        }  

    }
}

