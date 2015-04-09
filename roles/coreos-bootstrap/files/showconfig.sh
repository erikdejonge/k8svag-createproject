#!/bin/sh

cat  /etc/environment
cat /etc/systemd/network/static.network | grep Address

echo
echo "cat /etc/systemd/network/static.network | grep Address"
echo "grep DISCOVERY /run/systemd/system/etcd.service.d/20-cloudinit.conf"
echo "cat /var/lib/coreos-vagrant/vagrantfile-user-data"
echo "sudo coreos-cloudinit --from-file /var/lib/coreos-vagrant/vagrantfile-user-data"
echo "cat /var/run/systemd/system/etcd.service.d/*.conf"
echo "cat /var/run/systemd/system/fleet.service.d/*.conf"
echo "cat ls -las /var/run/systemd/system"
echo "curl -L http://127.0.0.1:4001/version"
echo "curl -L http://127.0.0.1:7001/version"
echo "curl -L http://127.0.0.1:4001/v2/keys/mykey"
echo "cat /etc/os-release"
echo "sudo systemctl status etcd"
echo "sudo systemctl restart etcd"
echo "sudo systemctl restart fleet"
echo "fleetctl list-machines"
echo "cat /run/flannel/subnet.env"
echo -e """
SystemD cheatsheet
systemctl start foobar.service\tUsed to start a service (not reboot persistent)
systemctl stop foobar.service\tUsed to stop a service (not reboot persistent)
systemctl restart foobar.service\tUsed to stop and then start a service
systemctl reload foobar.service\tWhen supported, reloads the config file without interrupting pending operations.
systemctl condrestart foobar.service\tRestarts if the service is already running.
systemctl status foobar.service\tTells whether a service is currently running.
ls /lib/systemd/system/*.service /etc/systemd/system/*.service\tUsed to list the services that can be started or stopped
systemctl enable foobar.service\tTurn the service on, for start at next boot, or other trigger.
systemctl disable foobar.service\tTurn the service off for the next reboot, or any other trigger.
systemctl is-enabled foobar.service\tUsed to check whether a service is configured to start or not in the current environment.
ls /etc/systemd/system/*.wants/foobar.service\tUsed to list what levels this service is configured on or off

cat /var/lib/coreos-vagrant/vagrantfile-user-data
cat /etc/os-release | grep VERSION_ID
cat /etc/systemd/network/static.network
sudo coreos-cloudinit --from-file /var/lib/coreos-vagrant/vagrantfile-user-data

journalctl -xe
"""
