#!/bin/bash

############################################################################################
# Install Azure DevOps Tools
############################################################################################

# wait for apt to be finished
while sudo fuser /var/{lib/{dpkg,apt/lists},cache/apt/archives}/lock >/dev/null 2>&1; do
   sleep 1
done

# Install Powershell (via snap)
sudo snap install powershell --classic  

# Install .NET 6 SDK
sudo apt-get install -y dotnet-sdk-6.0 

# Install azcopy  
wget -O azcopy_v10.tar.gz https://aka.ms/downloadazcopy-v10-linux && tar -xf azcopy_v10.tar.gz --strip-components=1  

# Instal Azure CLI for Linux
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash 