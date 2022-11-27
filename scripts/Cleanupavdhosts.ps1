$HostName = 'test-01'
$HostPoolName = 'debont-test-rg'
$ResourcegroupName = 'debont-test-rg'


# Remove avdhost from Azure Virtual Desktop
#Remove-AzWvdSessionHost -HostPoolName $HostPoolName -Name $HostName -ResourceGroupName $ResourcegroupName


# Remove avdhost from Azure Ad
Get-AzureADDevice -filter "DisplayName eq '$HostName'"| Remove-AzureADDevice


# Remove avdhost from Intune/Endpoint Manager
#Get-IntuneManagedDevice –Filter "deviceName eq '$HostName'" |Remove-IntuneManagedDevice


# Remove avdhost vm
# Get vm id
$vm = Get-AzVm -Name $HostName 

# Remove vm
$vm | Remove-AzVM 

# Remove nic
try {
    foreach($nicUri in $vm.NetworkProfile.NetworkInterfaces.Id) {
        $nic = Get-AzNetworkInterface -ResourceGroupName $vm.ResourceGroupName -Name $nicUri.Split('/')[-1]
        Remove-AzNetworkInterface -Name $nic.Name -ResourceGroupName $vm.ResourceGroupName -Force
        }
}
catch
{
    # Catch any error
    Write-Host "No nic's found"
}


# Remove OS Disk
try {
    Get-AzDisk | Where-Object { $_.ManagedBy -eq $vm.Id } | Remove-AzDisk -Force
    if ('DataDiskNames' -in $vm.PSObject.Properties.Name -and @($vm.DataDiskNames).Count -gt 0) {
       Foreach ($uri in $vm.StorageProfile.DataDisks.Vhd.Uri) {
       $dataDiskStorageAcct = Get-AzStorageAccount -Name $uri.Split('/')[2].Split('.')[0]
       $dataDiskStorageAcct | Remove-AzStorageBlob -Container $uri.Split('/')[-2] -Blob $uri.Split('/')[-1]
       }  
    }  
}
catch {
        # Catch any error
        Write-Host "No nic's found"
}