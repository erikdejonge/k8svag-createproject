#!/bin/sh
alias bootj="sudo journalctl --boot"
_ccat() { cat "$1" | sudo docker run -i dr.a8.nl/cryptobox/tools pygmentize -g; }
alias ccat="_ccat"
alias ccloud="cat /var/lib/coreos-vagrant/vagrantfile-user-data"
alias cp="cp -iv"
alias cpu_hogs="ps -Ao pid,pcpu,size,user,args --sort=-pcpu | head -n 10; echo"
alias cvid="cat /etc/os-release|grep VERSION_ID"
alias cvall="cat /etc/os-release"
alias dusort="du -hs * | sort -h"
alias etcdver="curl -L http://127.0.0.1:4001/version"
alias fleetlist="fleetctl list-machines"
alias flush_dns="dscacheutil -flushcache"            # flush_dns:     Flush out the DNS Cache
alias jboot="journalctl --boot"
alias jetcd="journalctl -u etcd"
alias jf="journalctl -f"
alias jfetcd="journalctl -f -u etcd"
alias jffdocker="journalctl -f -u docker"
alias jfflannel="journalctl -f -u flannel"
alias jffleet="journalctl -f -u fleet"
alias jflannel="journalctl -u flannel"
alias jfleet="journalctl -u fleet"
alias jdocker="journalctl -u docker"
alias jfdocker="journalctl -f -u docker"
alias ju="journalctl -u $1"
alias jfu="journalctl -f -u $1"
alias locate="sudo find / | grep $1"
alias lsunits="systemctl list-units"
alias lsunitsfl="fleetctl list-units"
alias mem_hogs="ps -Ao pid,pcpu,size,user,args --sort=-size | head -n 10; echo"
alias mkdir="mkdir -pv"
alias mv="mv -iv"
alias myip="curl ip.appspot.com"                    # myip:         Public facing IP Address
alias network="cat /etc/systemd/network/static.network"
alias open_ports="sudo lsof -i | grep LISTEN"        # open_ports:    All listening connections
alias qfind="find . -name"
alias runcloudcfg="sudo coreos-cloudinit --from-file /var/lib/coreos-vagrant/vagrantfile-user-data"
alias show_blocked="sudo ipfw list"                  # show_blocked:  All ipfw rules inc/ blocked IPs
alias stdocker="sudo systemctl status docker"
alias stetcd="sudo systemctl status etcd"
alias stflannel="sudo systemctl status flannel"
alias stfleet="sudo systemctl status fleet"
_stopunit() { sudo systemctl stop $1; }
alias stopunit="_stopunit"
_stopunitf() { sudo fleetctl stop $1; }
alias stopunitf="_stopunitf"
alias quit='echo 'bye'; sleep 0.2; exit;'
alias synctime="sudo systemctl stop ntpd.service;sudo ntpdate pool.ntp.org;sudo systemctl start ntpd.service"
export ETCDCTL_PEERS='http://192.168.14.51:4001'
export FLEETCTL_ENDPOINT='http://192.168.14.51:4001'
export DEFAULT_IPV4='192.168.14.51'
alias configk8sapi="curl http://127.0.0.1:8080;curl http://127.0.0.1:8080/version"
export PATH=$PATH:$HOME/bin

