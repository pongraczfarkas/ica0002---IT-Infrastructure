#!/bin/bash -ex

date > pre_exam.txt

exec > >(tee -ia pre_exam.txt) 2>&1

hostname

ansible-playbook infra.yaml --diff

ansible-playbook infra.yaml --diff

ansible pongraczfarkas-1 -b -m reboot -a "test_command=uptime"
ansible pongraczfarkas-2 -b -m reboot -a "test_command=uptime"
ansible pongraczfarkas-3 -b -m reboot -a "test_command=uptime"

sleep 30

ansible-playbook infra.yaml --diff

date
