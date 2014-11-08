#
# Copyright 2014 myOS Group. All rights reserved.
#

APPLICATION_DIRECTORY=$(pwd | awk -F'/' '{print $NF}')

source ${MYOS_PATH}/android/sdk/scripts/clean.sh
cd ${MYOS_PATH}/android/applications/${APPLICATION_DIRECTORY}
echo "===== Cleaning ${APPLICATION_DIRECTORY} ================================="
make clean
