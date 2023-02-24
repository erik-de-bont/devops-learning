Describe "Azure Resource Group" {
   

    Context "Resource Group exists" {
        $rg = (Get-AzResourceGroup -Name $resourceGroupName)
        It "Should be provisioned successfully" {
            $rg.ProvisioningState | Should -Be "Succeeded"
        }
    }
}