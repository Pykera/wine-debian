#!/bin/bash
cd /home/container

#Wine version
wine --version

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

Xvfb :99 &
export DISPLAY=:99

# Run the Server
${MODIFIED_STARTUP}