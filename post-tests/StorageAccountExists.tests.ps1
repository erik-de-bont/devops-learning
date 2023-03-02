## StorageaccountExists.Tests.ps1

Describe "Test if Azure Storage Account does not exist" -Tag 'Post-Tests' {

    BeforeAll {
    $storageAccount = Get-AzStorageAccount -ResourceGroupName $env:RESOURCEGROUPNAME -StorageAccountName $env:STORAGEACCOUNTNAME -ErrorAction SilentlyContinue
    }

    Context "Check if storageaccount $env:STORAGEACCOUNTNAME has been provision succesfully" {

        It "should be provisioned successfully" {
            $storageAccount.ProvisioningState | Should -Be "Succeeded"
        }  

    }
}