Describe "Azure Resource Group" {
    $rg = (Get-AzResourceGroup -Name $resourceGroupName)
    

    Context "Resource Group exists" {
        It "Should be provisioned successfully" {
            $rg.ProvisioningState | Should -Be "Succeeded"
        }
    }
}