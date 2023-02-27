#!/bin/bash

# Temp script
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

bash ${SCRIPTPATH}/k3d/epinio-k3d-create.sh
if [ $? -ne 0 ]; then
  exit 1
fi

bash ${SCRIPTPATH}/charts/cert-manager/cert-manager-install.sh
if [ $? -ne 0 ]; then
  exit 1
fi

bash ${SCRIPTPATH}/charts/ingress-nginx/ingress-nginx-install.sh 
if [ $? -ne 0 ]; then
  exit 1
fi

bash ${SCRIPTPATH}/charts/epinio/epinio-install.sh
if [ $? -ne 0 ]; then
  exit 1
fi
