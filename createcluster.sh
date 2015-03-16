#!/bin/sh
sudo date
killall python; killall Python; redis-cli flushall;killall python; killall Python; killall pypy;
rm -f hosts
rm -f ./configscripts/user-data*

if [ -d ".vagrant" ]; then
  echo ".vagrant directory still exsists (forgot deletecluster.sh?)"
  exit
fi

echo "Update vagrant image"
vagrant box update

echo "Add vagrant insecure keys"
ssh-add keys/insecure/vagrant

echo "preparing start"
rm -Rf .cl
k8svag up
while [ $? -ne 0 ]; do
    k8svag up
done

echo 'request coreos token'
if [ "$(uname)" == "Darwin" ]; then
    k8svag coreostoken > config/tokenosx.txt
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    k8svag coreostoken > config/tokenlinux.txt
fi

echo 'restart vmware network'
if [ "$(uname)" == "Darwin" ]; then
    sudo vmnet-cli --stop
    sleep 1
    sudo vmnet-cli --start
    sleep 2
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sudo /usr/bin/vmware-networks --stop
    sleep 1
    sudo /usr/bin/vmware-networks --start
    sleep 2
fi

echo "Bring machines up"
rm -f ~/.ssh/known_hosts
vagrant up
while [ $? -ne 0 ]; do
    echo "** vagrant up"
    if [ "$(uname)" == "Darwin" ]; then
        sudo vmnet-cli --stop
        sleep 1
        sudo vmnet-cli --start
        sleep 2
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        sudo /usr/bin/vmware-networks --stop
        sleep 1
        sudo /usr/bin/vmware-networks --start
        sleep 2
    fi
    vagrant up
done


vagrant up



