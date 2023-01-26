sed -i 's/"capture_name_prefix": "{{user `capture_name_prefix`}}",/"managed_imagename": "{{user `managed_imagename`}}",/g'./test-packer.json
sed -i 's/"capture_container_name": "images",/"managed_image_resource_group_name:" "{{user `managed_image_resource_group_name`}}",/g' ./test-packer.json
sed -i '/"storage_account": "{{user `storage_account`}}"/d' ./test-packer.json
sed -i '/"resource_group_name": "{{user `resource_group`}}"/d' ./test-packer.json
