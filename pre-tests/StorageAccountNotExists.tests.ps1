## StorageaccountNotExists.Tests.ps1

Describe 'Test if Azure Storage Account does not exist' -Tag 'Pre-Tests' {

    BeforeAll {
    $storageAccount = Get-AzStorageAccount -ResourceGroupName $env:RESOURCEGROUPNAME -StorageAccountName $env:STORAGEACCOUNTNAME -ErrorAction SilentlyContinue
    }

    Context "Check if storageaccount exists" {

        It "$env:STORAGEACCOUNTNAME should not exist" {
            $rg.ProvisioningState | Should -Not -Be "Succeeded"
        }  

    }
}

