## StorageaccountExists.Tests.ps1

Describe "Test if Azure Storage Account does not exist" {

    BeforeAll {
    $storageAccountName = "subariosstorage12345"
    $storageAccount = Get-AzStorageAccount -ResourceGroupName $ENV:resourceGroupName -StorageAccountName $ENV:storageAccountName -ErrorAction SilentlyContinue
    }

    Context "Check if storageaccount $storageAccount has been provision succesfully" {

        It "should be provisioned successfully" {
            $storageAccount.ProvisioningState | Should -Be "Succeeded"
        }  

    }
}