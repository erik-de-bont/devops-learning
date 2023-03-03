## StorageaccountExists.Tests.ps1

Describe "Test Storage Account" -Tag 'Post-Tests' {

    BeforeAll {
    $storageAccount = Get-AzStorageAccount -ResourceGroupName $env:RESOURCEGROUPNAME -StorageAccountName $env:STORAGEACCOUNTNAME -ErrorAction SilentlyContinue
    }

    Context "Check if storageaccount  $env:STORAGEACCOUNTNAME should has been provisioned succesfully" {

        It "Provisioning state should be 'Succeeded'" {
            $storageAccount.ProvisioningState | Should -Be "Succeeded"
        }  

    }
}