Describe "Azure Resource Group" {
 
    BeforeAll { 
        $rg = Get-AzResourceGroup -ResourceGroupName $ENV:resourceGroupName
    } 

    Context "Check if Resource Group $ENV:resourceGroupName exists" {

        It "should be provisioned successfully" {
            $rg.ProvisioningState | Should -Be "Succeeded"
        }
    }
}