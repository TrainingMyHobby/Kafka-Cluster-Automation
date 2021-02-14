# Kafka-Cluster-Automation
Apache Kafka cluster setup automation using Ansible, Terraform, CloudFormation

https://github.com/chrismeyersfsu/playbook-ec2_properties/blob/master/new_group.yml

# Ansible Common Commands

### Lists all the hosts
1. ./ansible-wrapper.sh all --list-hosts

### Create Zookeeper AWS EC2 instances
2. EXTRA_TAGS_VALUE=aws_ec2_instances_setup_zookeeper EXTRA_VARS_VALUE=" instances_setup_zookeeper=true aws_ec2_instances_setup_zookeeper=false " ./ansible-playbook-wrapper.sh playbooks/01-instances-create/01-zookeeper-chorum.yaml 


EXTRA_TAGS_VALUE=instances_setup_zookeeper,aws_ec2_instances_setup_zookeeper EXTRA_VARS_VALUE=" instances_setup_zookeeper=true aws_ec2_instances_setup_zookeeper=true " ./ansible-playbook-wrapper.sh playbooks/01-instances-create/01-zookeeper-chorum.yaml 


NOTE: Intentially setting aws_ec2_instances_setup_zookeeper=false and I expected the developer / administrator executing the above command to manually set the value to aws_ec2_instances_setup_zookeeper=true
Reason for the above is to prevent unnecessary AWS EC2 instances creation while learning this code or code documentation.
So, if you want zookeeper intances to be created you need to manually set aws_ec2_instances_setup_zookeeper=true before running the command

### Create Kafka AWS EC2 instances
3. EXTRA_TAGS_VALUE=aws_ec2_instances_setup_kafka,instances_setup_kafka EXTRA_VARS_VALUE=" instances_setup_kafka=true aws_ec2_instances_setup_kafka=false " ./ansible-playbook-wrapper.sh playbooks/01-instances-create/02-kafka-instances.yaml

### Install Zookeeper and Kafka on AWS EC2 instances
4. EXTRA_TAGS_VALUE=instances_software_install_kafka,aws_ec2_instances_software_intall_kafka EXTRA_VARS_VALUE=" instances_software_install_kafka=true aws_ec2_instances_software_intall_kafka=true " ./ansible-playbook-wrapper.sh playbooks/02-software-install/01-kafka-install.yaml


https://github.com/ansible/ansible-modules-core/issues/1009
Above link  provides solution to prevent EC2 instances re-creating if we run the same Ansible task again and again "AWS ec2 module - re-run of playbook creates new instances"


# This project setup
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
mkdir -p bin
mkdir -p cloud-keys
mkdir -p playbooks
mkdir -p inventories
mkdir -p roles
mkdir -p tasks

# /Applications/Python\ 3.7/Install\ Certificates.command
cd "${ROLES_BASE_PATH}"
ansible-galaxy collection install amazon.aws
ansible-galaxy init cluster-aws
cd "${DEV_BASE_PATH_ANSBILE}"

cd "${DEV_BASE_PATH_ANSBILE}"


