#!/bin/bash

yum install -y epel-release
yum install -y ansible

bash env_nodes.sh
su - ansible -c "ssh-keygen" <<< "\nn"
su - ansible -c "echo \"yes \n\" | sshpass -p password ssh-copy-id node1.example.com"
su - ansible -c "echo \"yes \n\" | sshpass -p password ssh-copy-id node2.example.com"

su - ansible -c "mkdir \"lesson_$1\""
su - ansible -c "touch lesson_$1/inventory && touch lesson_$1/ansible.cfg"
su - ansible -c "echo \"[nodes]
node1.example.com
node2.example.com\"" > /home/ansible/lesson_$1/inventory
su - ansible -c "echo \"[privilege_escalation]
become=True
become_method=sudo
become_user=root
become_ask_pass=False\"" > /home/ansible/lesson_$1/ansible.cfg
clear
su - ansible -c "cd lesson_$1"
su - ansible

