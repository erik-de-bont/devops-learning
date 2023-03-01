## StorageaccountNotExists.Tests.ps1

Describe "Test if Azure Storage Account does not exist" {

    BeforeAll {
    $storageAccount = Get-AzStorageAccount -ResourceGroupName $ENV:resourceGroupName -StorageAccountName $ENV:storageAccountName -ErrorAction SilentlyContinue
    }

    Context "Check if storageaccount exists" {

        It "$storageAccountName should not exist" {
            $storageAccount | Should -BeNullOrEmpty
        }  

    }
}

