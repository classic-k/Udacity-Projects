#!/bin/bash

#create config files and secrets for cluster
kubectl apply -f yaml_files/configmap.yaml
kubectl apply -f yaml_files/aws-secret.yml
kubectl apply -f env-secret.yaml

#create deployments and services
#user api deployment services
kubectl apply -f user-deployment.yaml
kubectl apply -f user-service.yaml

#feed api deployment services
kubectl apply -f yaml_files/feed-deployment.yaml
kubectl apply -f yaml_files/feed-service.yaml

#reverseproxy deployment services
kubectl apply -f yaml_files/proxy-deployment.yaml
kubectl apply -f yaml_files/proxy-service.yaml


#frontend deployment services
kubectl apply -f yaml_files/deployment.yaml
kubectl apply -f yaml_files/service.yaml

#Install metrics server 
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
#HPA 
kubectl apply -f yaml_files/hpa-deploy.yaml
