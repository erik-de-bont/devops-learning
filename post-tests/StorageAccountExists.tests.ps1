## StorageaccountExists.Tests.ps1

Describe "Test Storage Account" -Tag 'Post-Tests' {

    BeforeAll {
    $storageAccount = Get-AzStorageAccount -ResourceGroupName $env:RESOURCEGROUPNAME -StorageAccountName $env:STORAGEACCOUNTNAME -ErrorAction SilentlyContinue
    }

    Context "Check if storageaccount has been provisioned succesfully" {

        It "storage account $env:STORAGEACCOUNTNAMEshould provision state should be 'Succeeded'" {
            $storageAccount.ProvisioningState | Should -Be "Succeeded"
        }  

    }
}