#!/usr/bin/env bash

# must run as root
if [ `id -u` -ne 0 ]; then
  echo "Must be ran as root or sudo"
  exit
fi

if [ ! -f /usr/bin/apt-get ]; then
  echo "This os is not supported"
  exit
fi

if [ $SUDO_USER ]; then
  RealUser=$SUDO_USER
else
  RealUser=$(whoami)
fi

#if [ $EUID -ne 0 ]; then
#  if [ -d /root ]; then
#    RealHome="/root"
#  else
#    RealHome=$HOME
#  fi
#else
#  if [ -d /home/$RealUser ]; then
#    RealHome="/home/$RealUser"
#  else
#    RealHome=$HOME
#  fi
#fi

#if [ ! -d $RealHome/bespikeinstall ]; then
if [ ! -f /usr/bin/sudo ]; then
  echo "Installing sudo . . ."
  apt-get -q -q update
  DEBIAN_FRONTEND=noninteractive apt-get -q -q install -y sudo < /dev/null
  echo
fi

if [ ! -d /bespikeinstall ]; then
  if [ ! -f /usr/bin/git ]; then
    echo "Installing git . . ."
    apt-get -q -q update
    DEBIAN_FRONTEND=noninteractive apt-get -q -q install -y git < /dev/null
    echo
  fi
  
  echo "Downloading Bespike Installer . . ."
  git clone \
    https://github.com/bespike/bespikeinstall_setup \
    /bespikeinstall/install \
    < /dev/null 2> /dev/null
  echo
else
  cd /bespikeinstall/install
  chown -R $RealUser /bespikeinstall/install/.git/
  echo "Updating Bespike Installer"
  git fetch -all
  git reset --hard origin/master
  echo
fi

# Start setup script.
bash /bespikeinstall/install/start.sh