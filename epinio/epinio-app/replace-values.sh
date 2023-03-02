#!/bin/bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

cd $SCRIPTPATH

MONGODB_HOSTNAME=$(epinio service show mongodb | grep mongodb.workspace | awk '{print $5}' | cut -d ":" -f 1)
MONGODB_CONFIG=$(echo ${MONGODB_HOSTNAME} | cut -d "." -f 1)
MONGODB_PASSWORD=$(epinio configuration show ${MONGODB_CONFIG} | grep password | awk '{print $4}')


cp ${SCRIPTPATH}/clipboard-backend-template.yml ${SCRIPTPATH}/clipboard-backend.yml

find -name "clipboard-backend.yml" -exec sed -in "s,PLACE_HOLDER_MONGODB_PASSWORD,$MONGODB_PASSWORD,g"  {} \;
find -name "clipboard-backend.yml" -exec sed -in "s,PLACE_HOLDER_MONGODB_HOSTNAME,$MONGODB_HOSTNAME,g"  {} \;
