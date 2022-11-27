# Install Powershell Core Ubuntu Linux 18.04
wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb &&
sudo dpkg -i packages-microsoft-prod.deb &&
sudo apt-get update &&
sudo apt-get install powershell

# Install Powershell Core Ubuntu Linux 18.04
sudo apt-get uninstall powershell

# Snap Install
sudo snap install powershell --classic

# Snap Uninstall 
sudo snap remove powershell