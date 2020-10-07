#! /bin/bash

if [[ "$OSTYPE" == "darwin"* ]]; then
  kubectl apply -f https://raw.githubusercontent.com/nginxinc/kubernetes-ingress/master/deployments/common/ns-and-sa.yaml
  kubectl apply -f https://raw.githubusercontent.com/nginxinc/kubernetes-ingress/master/deployments/common/default-server-secret.yaml
  kubectl apply -f https://raw.githubusercontent.com/nginxinc/kubernetes-ingress/master/deployments/common/nginx-config.yaml
  kubectl apply -f https://raw.githubusercontent.com/nginxinc/kubernetes-ingress/master/deployments/deployment/nginx-ingress.yaml
  kubectl apply -f https://raw.githubusercontent.com/nginxinc/kubernetes-ingress/master/deployments/service/loadbalancer.yaml

  kubectl apply -f ./k8s/ingress.yaml
else
  kubectl.exe apply -f https://raw.githubusercontent.com/nginxinc/kubernetes-ingress/master/deployments/common/ns-and-sa.yaml
  kubectl.exe apply -f https://raw.githubusercontent.com/nginxinc/kubernetes-ingress/master/deployments/common/default-server-secret.yaml
  kubectl.exe apply -f https://raw.githubusercontent.com/nginxinc/kubernetes-ingress/master/deployments/common/nginx-config.yaml
  kubectl.exe apply -f https://raw.githubusercontent.com/nginxinc/kubernetes-ingress/master/deployments/deployment/nginx-ingress.yaml
  kubectl.exe apply -f https://raw.githubusercontent.com/nginxinc/kubernetes-ingress/master/deployments/service/loadbalancer.yaml

  kubectl.exe apply -f ./k8s/ingress.yaml
fi
