#!/bin/bash

############################################################################################
# Install Azure DevOps Tools
############################################################################################

# wait for apt to be finished
while sudo fuser /var/{lib/{dpkg,apt/lists},cache/apt/archives}/lock >/dev/null 2>&1; do
   sleep 1
done

# Instal Azure CLI for Linux
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash &&


# Install Powershell (via snap)
sudo snap install powershell --classic 
