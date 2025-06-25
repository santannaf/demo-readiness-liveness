#!/bin/bash

set -e

echo "🚀 Criando cluster 'dca'..."
minikube start -p dca --driver=docker

echo "🚀 Criando cluster 'dcb'..."
minikube start -p dcb --driver=docker

echo "✅ Clusters 'dca' e 'dcb' criados com sucesso."

echo ""
echo "🌐 IPs dos clusters:"
echo "🔹 DCA: $(minikube ip -p dca)"
echo "🔹 DCB: $(minikube ip -p dcb)"

echo ""
echo "🧪 Para interagir com um cluster, use:"
echo "kubectl config use-context dca"
echo "kubectl config use-context dcb"