# Kafka-Cluster-Automation
Apache Kafka cluster setup automation using Ansible, Terraform, CloudFormation


# Ansible Common Commands

1. ./ansible-wrapper.sh all --list-hosts


# This project setup
DEV_BASE_PATH=${PWD}
DEV_BASE_PATH_ANSBILE=${DEV_BASE_PATH}/ansible

ANSBILE_CFG_FILE="${DEV_BASE_PATH_ANSBILE}/ansible.cfg"
ANSBILE_WRAPPER="${DEV_BASE_PATH_ANSBILE}/ansible-wrapper.sh"
ANSBILE_PLAYBOOK_WRAPPER="${DEV_BASE_PATH_ANSBILE}/ansible-playbook-wrapper.sh"

mkdir -p "${DEV_BASE_PATH_ANSBILE}"

cd "${DEV_BASE_PATH_ANSBILE}"
touch "${ANSBILE_CFG_FILE}"
touch "${ANSBILE_WRAPPER}"
touch "${ANSBILE_PLAYBOOK_WRAPPER}"
mkdir -p bin
mkdir -p cloud-keys
mkdir -p playbooks
mkdir -p inventories
mkdir -p roles
mkdir -p tasks

