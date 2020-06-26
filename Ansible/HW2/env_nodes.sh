#!/bin/bash

yum -y install nano
useradd ansible
echo password | passwd --stdin ansible
echo "ansible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible
