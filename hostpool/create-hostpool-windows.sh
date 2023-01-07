az vmss create \
--name devopshostpool-windows \
--resource-group debont-devops-rg \
--image Win2022Datacenter \
--vm-sku Standard_D4ads_v5 \
--storage-sku StandardSSD_LRS \
--authentication-type password \
--admin-user 'azureadmin' \
--admin-password 'Welkom123456' \
--instance-count 0 \
--disable-overprovision \
--upgrade-policy-mode manual \
--single-placement-group false \
--platform-fault-domain-count 1 \
--load-balancer "" \
--lb-sku Standard 


