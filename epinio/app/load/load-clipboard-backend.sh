#!/bin/bash

CLIPBOARD_BACKEND_INGRESS_URL=$(kubectl get ingress -A | grep clipboard | awk '{print $4}')

for counter in {1..100}; do
  curl -s https://${CLIPBOARD_BACKEND_INGRESS_URL}/clipboard \
    -X POST \
    --header "Content-Type:application/json" \
    --data "{\"content\":\"${RANDOM}\"}" \
    --insecure > /dev/null
done