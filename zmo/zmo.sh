#!/usr/bin/env sh

set -e

ansible-playbook bootstrap.yml

ansible-playbook zmo.yml
