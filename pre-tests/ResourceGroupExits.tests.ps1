#ResourceGroupExist.test.ps1

    Describe "Azure Resource Group" {
 
        BeforeAll { 
            $rg = Get-AzResourceGroup -ResourceGroupName $ENV:resourceGroupName -ErrorAction SilentlyContinue
        } 
    
        Context "Check if Resource Group $ENV:resourceGroupName exists" {
    
            It "should be provisioned successfully" {
                $rg.ProvisioningState | Should -Be "Succeeded"
            }
        }
    }