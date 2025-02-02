#!/usr/bin/env sh

set -e

./configs.sh
ansible-playbook playbook.yaml

