#!/bin/bash

export NAMESPACE=jhub
export RELEASE=jhub
export ZONE=us-central1-c
export CLUSTERNAME=jupyterhub

helm delete ${RELEASE} --purge

kubectl delete namespace ${NAMESPACE}

gcloud container clusters delete ${CLUSTERNAME} --zone=${ZONE}