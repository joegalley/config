#!/bin/bash

clear
echo -e "running setup.sh..."

# install VMWare tools
tar -xzf VMwareTools-9.6.2-1688356.tar.gz
perl vmware-install.pl

apt-get -qq update

# git
git --version 2>&1 >/dev/null
GIT_INSTALLED=$?
if [ $GIT_INSTALLED -eq 0 ];
then
  echo -e "\ngit is already installed [version " $(git --version)"]"
else
  echo -e "\ninstalling git"
fi


# cURL
#sudo apt-get install curl


# zsh (z shell)
zsh --version 2>&1 >/dev/null
ZSH_INSTALLED=$?
if [ $ZSH_INSTALLED -eq 0 ];
then
  echo -e "\nzsh is already installed [version " $(zsh --version)"]"
else
  echo -e "\ninstalling zsh"
  apt-get -y install zsh
fi


# docker-compose
curl -L https://github.com/docker/compose/releases/download/1.15.0/docker-compose-Linux-x86_64 > /tmp/docker-compose
chmod +x /tmp/docker-compose
mv /tmp/docker-compose /usr/local/bin
echo -e "\ndocker-compose is already installed [version " $(docker-compose --version)"]"

echo -e "\ndone"

