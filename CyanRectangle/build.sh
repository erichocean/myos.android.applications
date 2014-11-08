#
# Copyright 2014 myOS Group. All rights reserved.
#

TARGET=NativeActivity

APPLICATION_DIRECTORY=$(pwd | awk -F'/' '{print $NF}')

source ${MYOS_PATH}/android/sdk/scripts/build.sh

echo "============================== Building ${APPLICATION_DIRECTORY} =============================="
cd ${MYOS_PATH}/android/applications/${APPLICATION_DIRECTORY}
make || exit
