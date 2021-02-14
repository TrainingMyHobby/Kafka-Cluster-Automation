# Kafka-Cluster-Automation
Apache Kafka cluster setup automation using Ansible, Terraform, CloudFormation

https://github.com/chrismeyersfsu/playbook-ec2_properties/blob/master/new_group.yml

# Ansible Common Commands

### Lists all the hosts
1. ./ansible-wrapper.sh all --list-hosts

# This project setup 

Go to the root of the Git repo folder
```sh

DEV_BASE_PATH=${PWD}
DEV_BASE_PATH_ANSBILE=${DEV_BASE_PATH}/ansible
ROLES_BASE_PATH=${DEV_BASE_PATH_ANSBILE}/roles

ANSBILE_CFG_FILE="${DEV_BASE_PATH_ANSBILE}/ansible.cfg"
ANSBILE_WRAPPER="${DEV_BASE_PATH_ANSBILE}/ansible-wrapper.sh"
ANSBILE_PLAYBOOK_WRAPPER="${DEV_BASE_PATH_ANSBILE}/ansible-playbook-wrapper.sh"

mkdir -p "${DEV_BASE_PATH_ANSBILE}"

cd "${DEV_BASE_PATH_ANSBILE}"
touch "${ANSBILE_CFG_FILE}"
touch "${ANSBILE_WRAPPER}"
touch "${ANSBILE_PLAYBOOK_WRAPPER}"
touch site.yaml
touch all_zookeeper_quorum.yaml
touch all_kafka_brokers.yaml
touch all_instances_create.yaml
touch all_instances_destroy.yaml
touch all_instances_software.yaml
touch all_instances_ops.yaml
touch zookeeper_quorum_instances_create.yaml
touch zookeeper_quorum_instances_destroy.yaml
touch zookeeper_quorum_instances_software.yaml
touch zookeeper_quorum_instances_ops.yaml
touch kafka_brokers_instances_create.yaml
touch kafka_brokers_instances_destroy.yaml
touch kafka_brokers_instances_software.yaml
touch kafka_brokers_instances_ops.yaml
mkdir -p bin
mkdir -p inventories/aws/dev
mkdir -p inventories/aws/production
mkdir -p inventories/aws/staging
mkdir -p group_vars
mkdir -p host_vars
mkdir -p tasks
mkdir -p playbooks

mkdir -p roles
mkdir -p tasks

# /Applications/Python\ 3.7/Install\ Certificates.command
cd "${ROLES_BASE_PATH}"
ansible-galaxy collection install amazon.aws
ansible-galaxy init common
ansible-galaxy init zookeeper_quorum
ansible-galaxy init kafka_brokers
ansible-galaxy init app_security_kerberos
ansible-galaxy init app_security_ssl
ansible-galaxy init env_aws_ec2

cd "${DEV_BASE_PATH_ANSBILE}"


```
