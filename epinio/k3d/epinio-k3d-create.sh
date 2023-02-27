#!/bin/bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# Creating k3d cluster
export K3D_FIX_DNS=1
k3d cluster create --config $SCRIPTPATH/epinio-k3d-config.yml --k3s-arg "--disable=traefik@server:0"