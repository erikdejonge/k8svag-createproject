#!/bin/sh
alias bootj="sudo journalctl --boot"

alias hist="history"

alias jetcd="journalctl -u etcd"
alias jflannel="journalctl -u flannels"
alias jfleet="journalctl -u fleet"
alias jdocker="journalctl -u docker"

alias locate="sudo find / | grep $1"
alias lsunits="systemctl list-units"
alias lsunitsfl="fleetctl list-units"
alias lsmachfl="fleetctl list-machines"

alias stdocker="sudo systemctl status docker"
alias stetcd="sudo systemctl status etcd"
alias stflannel="sudo systemctl status flanneld"
alias stfleet="sudo systemctl status fleet"
alias synctime="sudo systemctl stop ntpd.service;sudo ntpdate pool.ntp.org;sudo systemctl start ntpd.service"

function _dostatus() {
  stat=$(sudo systemctl status $1 | grep active | xargs echo)
  if [ -z "$stat" ]
  then
    echo -e $1 "\033[0;31mFailed\033[0m"
  else
    echo -e $1 "\033[0;32mActive\033[0m"
  fi;
}

function _units() {
  for unit in $units; do
    _dostatus $unit
  done;
}

function _failedunits() {
  for funit in $funits; do
    sudo systemctl status $funit
  done;
}

function _status() {
   units=$(systemctl list-units | grep loaded | grep ".service" | grep -v systemd | grep -v "@" | awk '{print $1}')
   _units
   echo -e "\n\033[0;31m== Failed ==\033[0m"
   funits=$(systemctl list-units | grep loaded | grep -v active | grep -v Reflects| awk '{print $1}')
   _failedunits
}

alias status="_status"
alias stats="_status"

export PATH=$PATH:$HOME/bin