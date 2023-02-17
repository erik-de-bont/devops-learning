## StorageaccountNotExists.Tests.ps1

Describe "Test if Azure Storage Account does not exist" {
    $storageAccountName = "subariosstorage12345"
    $resourceGroupName = "debont-test-rg"

    $exists = (Get-AzStorageAccount -ResourceGroupName $resourceGroupName -StorageAccountName $storageAccountName  -ErrorAction SilentlyContinue)    
        It "Should return Null or Empty" {
            $exists| Should -BeNullOrEmpty

        }
    }

