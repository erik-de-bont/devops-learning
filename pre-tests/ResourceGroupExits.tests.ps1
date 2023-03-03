#ResourceGroupExist.test.ps1

    Describe 'Resource Group' -Tag 'Pre-Tests' {
    
        Context "Check if Resource Group $env:RESOURCEGROUPNAME exists" {
            $rg = Get-AzResourceGroup -ResourceGroupName $env:RESOURCEGROUPNAME -ErrorAction SilentlyContinue
            
            It "should be provisioned successfully" {
                $rg.ProvisioningState | Should -Be "Succeeded"
            }
        }
    }