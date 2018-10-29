#!/bin/bash

# Set the zone
export ZONE=us-central1-c
gcloud config set compute/zone $ZONE

# Create the cluster
export CLUSTERNAME=jupyterhub

gcloud beta container clusters create $CLUSTERNAME \
  --machine-type n1-standard-2 \
  --num-nodes 2 \
  --cluster-version latest \
  --node-labels hub.jupyter.org/node-purpose=core

# Test to see if the cluster is initialized
kubectl get node

# Create a new user
export EMAIL=bsamadi@connected.io

kubectl create clusterrolebinding cluster-admin-binding \
  --clusterrole=cluster-admin \
  --user=$EMAIL