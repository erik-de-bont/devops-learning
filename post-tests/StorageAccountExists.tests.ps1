## StorageaccountTests.Tests.ps1

Describe "Test if Azure Storage Account does exists" {
    $storageAccountName = "subariosstorage12345"
    $resourceGroupName = "debont-test-rg"

    Context "When the Azure Storage Account does exist" {
        $exists = (Get-AzStorageAccount -ResourceGroupName $resourceGroupName -StorageAccountName $storageAccountName  -ErrorAction SilentlyContinue)    
        It "Should return true" {
            $exists| Should -Not -BeNullOrEmpty

        }
    }
}