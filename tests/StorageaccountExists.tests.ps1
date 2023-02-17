## StorageaccountTests.Tests.ps1

Describe "Test-AzureStorageAccountExists" {
    $storageAccountName = "debontdevopspackersa"
    $resourceGroupName = "debont-devops-rg"

    Context "When the Azure Storage Account exists" {
        $exists = (Get-AzStorageAccount -ResourceGroupName $resourceGroupName -StorageAccountName $storageAccountName -ErrorAction SilentlyContinue)
        It "Should return True" {
            $exists | Should Not BeNullOrEmpty 
        }
    }

    Context "When the Azure Storage Account does not exist" {
        $exists = (Get-AzStorageAccount -ResourceGroupName $resourceGroupName -StorageAccountName $storageAccountName  -ErrorAction SilentlyContinue)    
        It "Should return False" {
            $exists| Should BeNullOrEmpty 

        }
    }
}
