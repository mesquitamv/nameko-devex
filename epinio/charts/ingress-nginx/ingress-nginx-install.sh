#!/bin/bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# Install NGINX
helm upgrade \
  --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx \
  --create-namespace \
  --set controller.ingressClassResource.default=true \
  --values $SCRIPTPATH/values-ingress-nginx.yml
  # --set controller.config='{"proxy-body-size": "50m", "proxy-read-timeout": 600}'

