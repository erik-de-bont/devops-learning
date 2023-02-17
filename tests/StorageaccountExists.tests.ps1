## StorageaccountTests.Tests.ps1

Describe "Test-AzureStorageAccountExists" {
    $storageAccountName = "debontdevopspackersa"
    $resourceGroupName = "debont-devops-rg"

    Context "When the Azure Storage Account exists" {
        It "Should return True" {
            $exists = (Get-AzStorageAccount -ResourceGroupName $resourceGroupName -StorageAccountName $storageAccountName -ErrorAction SilentlyContinue)
            $ValidationResult | Should Not BeNullOrEmpty 
        }
    }

    Context "When the Azure Storage Account does not exist" {
        It "Should return False" {
            $exists = (Get-AzStorageAccount -ResourceGroupName $resourceGroupName -StorageAccountName $storageAccountName  -ErrorAction SilentlyContinue)
            $exists| Should BeNullOrEmpty 

        }
    }
}
