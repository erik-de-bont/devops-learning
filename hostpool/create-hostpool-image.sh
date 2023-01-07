az vmss create \
--name devopshostpool-image \
--resource-group debont-devops-rg \
--image UbuntuLTS \
--vm-sku Standard_D4ads_v5 \
--storage-sku StandardSSD_LRS \
--authentication-type SSH \
--generate-ssh-keys \
--instance-count 0 \
--disable-overprovision \
--upgrade-policy-mode manual \
--single-placement-group false \
--platform-fault-domain-count 1 \
--load-balancer "" \
--lb-sku Standard


az vmss extension set \
  --resource-group debont-devops-rg \
  --vmss-name devopshostpool \
  --name customScript \
  --publisher Microsoft.Azure.Extensions \
  --protected-settings '{"fileUris": ["https://debontdevopssa.blob.core.windows.net/scripts/postinstall-hostpool.sh"],"commandToExecute": "./postinstall-hostpool.sh"}'