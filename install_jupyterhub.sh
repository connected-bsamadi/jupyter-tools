#!/bin/bash

export NAMESPACE=jhub
export RELEASE=jhub

helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
helm repo update

helm upgrade --install $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE  \
  --version 0.7.0 \
  --values config.yaml

kubectl get pod --namespace $NAMESPACE

kubectl get service --namespace $NAMESPACE