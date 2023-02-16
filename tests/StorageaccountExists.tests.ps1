## StorageaccountTests.Tests.ps1


describe "Check if storageaccount exists" {

    $storageAccountName = 'subariosstorage12345'
    $RGName = 'debont-devops-rg'  
    $storageAccount = Get-AzStorageAccount -ResourceGroupName $RGName-StorageAccountName $storageAccountName

    it "StorageAccount $storageAccountName should not exist" {
        $storageAccount | Should Not be $null
    }
}
