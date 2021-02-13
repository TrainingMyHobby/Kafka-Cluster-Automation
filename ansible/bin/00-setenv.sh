CURR_DIR=$(dirname $0)

ANSIBLE_CONFIG_FILE_PATH=${CURR_DIR}/../ansible.cfg
ANSBILE_COMMAND_PREFIX="ANSIBLE_CONFIG=${ANSIBLE_CONFIG_FILE_PATH} ansible "
ANSBILE_PLAYBOOK_COMMAND_PREFIX="ANSIBLE_CONFIG=${ANSIBLE_CONFIG_FILE_PATH} ansible-playbook "

echo "CURR_DIR                          ${CURR_DIR}"
echo "ANSIBLE_CONFIG_FILE_PATH          ${ANSIBLE_CONFIG_FILE_PATH}"
echo "ANSBILE_COMMAND_PREFIX            ${ANSBILE_COMMAND_PREFIX}"
echo "ANSBILE_PLAYBOOK_COMMAND_PREFIX   ${ANSBILE_PLAYBOOK_COMMAND_PREFIX}"