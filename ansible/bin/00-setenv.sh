CURR_DIR_SETENV=$(dirname $0)

mkdir -p ${CURR_DIR_SETENV}/../logs
touch ${CURR_DIR_SETENV}/../logs/ansible.log

CURRENT_ENV=dev
RUNTIME_ENV_TYPE=aws
INVENTORY_FILE="${CURR_DIR_SETENV}/../ansible/inventories/${RUNTIME_ENV_TYPE}/${CURRENT_ENV}/hosts.yaml"
ROLES_BASE_PATH=${CURR_DIR_SETENV}/../ansible/roles

# VARS
EXTRA_VARS_FINAL=" CURRENT_ENV=${CURRENT_ENV} RUNTIME_ENV_TYPE=${RUNTIME_ENV_TYPE} "
if [[ -z "${EXTRA_VARS_VALUE}" ]]; then
  EXTRA_VARS_FINAL="${EXTRA_VARS_FINAL}"
else
  EXTRA_VARS_FINAL="${EXTRA_VARS_FINAL} ${EXTRA_VARS_VALUE}"
fi

# TAGS
EXTRA_TAGS_FINAL="  "
if [[ -z "${EXTRA_TAGS_VALUE}" ]]; then
  EXTRA_TAGS_FINAL="${EXTRA_TAGS_FINAL}"
else
  EXTRA_TAGS_FINAL=" --tags ${EXTRA_TAGS_VALUE}"
fi

ANSIBLE_CONFIG_FILE_PATH=${CURR_DIR_SETENV}/../ansible.cfg
ANSBILE_COMMAND_PREFIX="ANSIBLE_CONFIG=${ANSIBLE_CONFIG_FILE_PATH} ansible -i ${INVENTORY_FILE} --extra-vars \"${EXTRA_VARS_FINAL} \"  ${EXTRA_TAGS_FINAL} "
ANSBILE_PLAYBOOK_COMMAND_PREFIX="ANSIBLE_CONFIG=${ANSIBLE_CONFIG_FILE_PATH} EXTRA_VARS_FINAL="${EXTRA_VARS_FINAL}" ansible-playbook -i ${INVENTORY_FILE} --extra-vars \"${EXTRA_VARS_FINAL} \"  ${EXTRA_TAGS_FINAL}  "

# echo "CURR_DIR_SETENV                   ${CURR_DIR_SETENV}"
# echo "ANSIBLE_CONFIG_FILE_PATH          ${ANSIBLE_CONFIG_FILE_PATH}"
# echo "INVENTORY_FILE                    ${INVENTORY_FILE}"
# echo "ANSBILE_COMMAND_PREFIX            ${ANSBILE_COMMAND_PREFIX}"
# echo "ANSBILE_PLAYBOOK_COMMAND_PREFIX   ${ANSBILE_PLAYBOOK_COMMAND_PREFIX}"
# echo "ROLES_BASE_PATH                   ${ROLES_BASE_PATH}"
echo "EXTRA_VARS_FINAL                   ${EXTRA_VARS_FINAL}"
echo "EXTRA_TAGS_FINAL                   ${EXTRA_TAGS_FINAL}"