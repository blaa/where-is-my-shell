#!/bin/bash

echo "Installing using Ansible. Ansible needs to be installed locally"

ansible-playbook -i hosts site.yml
