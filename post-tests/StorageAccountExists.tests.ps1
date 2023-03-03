## StorageaccountExists.Tests.ps1

Describe "Test Storage Account" -Tag 'Post-Tests' {

    BeforeAll {
    $storageAccount = Get-AzStorageAccount -ResourceGroupName $env:RESOURCEGROUPNAME -StorageAccountName $env:STORAGEACCOUNTNAME -ErrorAction SilentlyContinue
    }

    Context "Check if storageaccount $env:STORAGEACCOUNTNAME has been provisioned succesfully" {

        It "should be provisioned successfully" {
            $storageAccount.ProvisioningState | Should -Be "Succeeded"
        }  

    }
}