## StorageaccountTests.Tests.ps1

Describe "Test-AzureStorageAccountExists" {
    $storageAccountName = "subariosstorage12345"
    $resourceGroupName = "debont-test-rg"

    Context "When the Azure Storage Account exists" {
        It "Should return True" {
            $exists = (Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName -ErrorAction SilentlyContinue)
            $exists.ShouldNot.BeNullOrEmpty()
        }
    }

    Context "When the Azure Storage Account does not exist" {
        It "Should return False" {
            $exists = (Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName  -ErrorAction SilentlyContinue)
            $exists.Should.BeNullOrEmpty()
        }
    }
}
