#!/bin/bash
# Author : kemy
# Github : kemyke
# Version : 0.1


#Install mono
mkdir /mono
wget http://download.mono-project.com/repo/xamarin.gpg -P /mono
rpm --import /mono/xamarin.gpg
yum-config-manager --add-repo http://download.mono-project.com/repo/centos/
yum install -y mono-complete