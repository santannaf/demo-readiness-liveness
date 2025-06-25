#!/bin/bash

kubectl config use-context dca

#  kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.10/config/manifests/metallb-native.yaml     


#  kubectl create secret generic -n metallb-system memberlist


kubectl --context=dca apply -f deploy_a.yaml
kubectl --context=dca apply -f metallb-config-dca.yaml

echo "====== Fazendo o cluster DC B ====== "

kubectl config use-context dcb


# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.10/config/manifests/metallb-native.yaml     


# kubectl create secret generic -n metallb-system memberlist


kubectl apply -f deploy_b.yaml
kubectl --context=dcb apply -f metallb-config-dcb.yaml

# kubectl --context=dca port-forward svc/hello-service 8081:80
# kubectl --context=dcb port-forward svc/hello-service 8082:80
# sudo nginx -s reload  


# minikube start -p dca --driver=docker                                                                                                                                                                           ─╯
# minikube start -p dcb --driver=docker


# kubectl --context=dca run debug --rm -it --image=alpine -- sh  
# apk add --no-cache postgresql-client
# psql -h host.minikube.internal -U user -d mydb -p 5433