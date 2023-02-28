## StorageaccountTests.Tests.ps1

Describe "Test if Azure Storage Account does exists" {
    BeforeAll {
        $storageAccountName = "subariosstorage12345"
        $storageAccount = Get-AzStorageAccount -ResourceGroupName $ENV:rgName -StorageAccountName $storageAccountName -ErrorAction SilentlyContinue
        }

    Context "$StorageAccount" {
        $exists = (Get-AzStorageAccount -ResourceGroupName $resourceGroupName -StorageAccountName $storageAccountName  -ErrorAction SilentlyContinue)    
        It "Should return true" {
            $exists| Should -Not -BeNullOrEmpty

        }
    }
}
