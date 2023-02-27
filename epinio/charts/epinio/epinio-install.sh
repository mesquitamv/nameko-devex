#!/bin/bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
LOADBALANCER_IP=$(kubectl get svc -n ingress-nginx ingress-nginx-controller -o jsonpath={@.status.loadBalancer.ingress} | jq -r .[].ip) 

helm install epinio -n epinio --create-namespace epinio/epinio --values $SCRIPTPATH/values-epinio.yml --set global.domain=${LOADBALANCER_IP}.omg.howdoi.website