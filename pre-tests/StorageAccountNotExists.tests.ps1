## StorageaccountNotExists.Tests.ps1

Describe 'Test Storage Account' -Tag 'Pre-Tests' {

    BeforeAll {
    $storageAccount = Get-AzStorageAccount -ResourceGroupName $env:RESOURCEGROUPNAME -StorageAccountName $env:STORAGEACCOUNTNAME -ErrorAction SilentlyContinue
    }

    Context "Check if storageaccount $env:STORAGEACCOUNTNAME exists" {

        It "storage account should not exist" {
            $storageAccount.ProvisioningState | Should -Not -Be "Succeeded"
        }  

    }
}

