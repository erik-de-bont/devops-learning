Describe "Azure Resource Group" {
 
    BeforeAll { 
        $rg = Get-AzResourceGroup -ResourceGroupName $ENV:rgName
    } 

    Context "Check if Resource Group $ENV:rgName exists" {
       
        It "name should exits" {
            $rg.Name | Should -Be $ENV:rgName
        }


        It "should be provisioned successfully" {
            $rg.ProvisioningState | Should -Be "Succeeded"
        }
    }
}