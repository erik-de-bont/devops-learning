## StorageaccountTests.Tests.ps1


describe "Check if storageaccount exists" {

    $storageAccountName = 'subariosstorage12345'
    $RGName = 'debont-devops-rg'  
    $storageAccount = Test-AzureName -StorageAccountName $storageAccountName



    it "StorageAccount $storageAccount should not exist" {
        $storageAccount | Should Not be $null
    }
}
