#!/bin/sh
killall python; killall Python; redis-cli flushall;killall python; killall Python; killall pypy;
echo "Ensure pip directory"
k8svag clustercommand "sudo mkdir /root/pypy&&sudo ln -s /home/core/bin /root/pypy/bin"

echo "Python and pip"
k8svag ansibleplaybook all:./playbooks/ansiblebootstrap.yml
k8svag ansibleplaybook all:./playbooks/testansible.yml

echo "Generate new keys"
cd keys/secure&&./genpair.sh&&cd ../..
ssh-add keys/secure/vagrantsecure

echo "Replace insecure keys with new keys"
k8svag ansibleplaybook all:./playbooks/keyswap.yml

echo "Restart cluster with new token"
k8svag replacecloudconfig

