CURR_DIR=$(dirname $0)

clear
. ${CURR_DIR}/bin/00-setenv.sh

eval "${ANSBILE_PLAYBOOK_COMMAND_PREFIX} $*"