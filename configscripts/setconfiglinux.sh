#!/bin/sh

cat ./roles/coreos-bootstrap/files/bootstraplinux.txt > ./roles/coreos-bootstrap/files/bootstrap.sh
echo "192.168.14.5" > ./config/startip.txt
echo "node" > ./config/basehostname.txt
echo "3a1f12c5-de6a-4ca9-9357-579598038cd8" > ./config/updatetoken.txt
cat ./config/tokenlinux.txt > ./config/token.txt

sed -e 's/$num_instances = x/$num_instances = 7/g' Vagrantfile.tpl.rb > Vagrantfile
sed -i 's/$vm_gui = false/$vm_gui = false/g' Vagrantfile
sed -i 's/$vm_memory = x/$vm_memory = 2048/g' Vagrantfile
sed -i "s/$update_channel = 'beta'/$update_channel = 'beta'/g" Vagrantfile
