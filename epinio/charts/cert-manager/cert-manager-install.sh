#!/bin/bash

# Install Cert Manager
kubectl create namespace cert-manager
  helm repo add jetstack https://charts.jetstack.io
  helm repo update
  helm install cert-manager --namespace cert-manager jetstack/cert-manager \
    --set installCRDs=true \
    --set extraArgs={--enable-certificate-owner-ref=true}