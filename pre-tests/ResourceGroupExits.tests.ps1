#ResourceGroupExist.test.ps1

    Describe 'Resource Group Tests' -Tag 'Pre-Tests' {
 
        BeforeAll { 
            $rg = Get-AzResourceGroup -ResourceGroupName $env:RESOURCEGROUPNAME -ErrorAction SilentlyContinue
        } 
    
        Context "Check if Resource Group $env:RESOURCEGROUPNAME exists" {
    
            It "should be provisioned successfully" {
                $rg.ProvisioningState | Should -Be "Succeeded"
            }
        }
    }