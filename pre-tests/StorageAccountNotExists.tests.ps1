## StorageaccountNotExists.Tests.ps1

Describe 'Test Storage Account' -Tag 'Pre-Tests' {

    BeforeAll {
    $storageAccount = Get-AzStorageAccount -ResourceGroupName $env:RESOURCEGROUPNAME -StorageAccountName $env:STORAGEACCOUNTNAME -ErrorAction SilentlyContinue
    }

    Context "Check if storageaccount exists" {

        It "storage account $env:STORAGEACCOUNTNAME should not exist" {
            $storageAccount.ProvisioningState | Should -Not -Be "Succeeded"
        }  

    }
}

