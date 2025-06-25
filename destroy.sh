#!/bin/bash

set -e

echo "🚧 Parando e removendo cluster 'dca'..."
minikube delete -p dca --all --purge

echo "🚧 Parando e removendo cluster 'dcb'..."
minikube delete -p dcb --all --purge

echo "🧹 Limpando cache de imagens e arquivos temporários do Minikube..."
minikube cache delete
minikube config unset profile || true

echo "🧼 Removendo diretórios locais usados pelo Minikube (pode requerer sudo)..."
rm -rf ~/.minikube
rm -rf ~/.kube

echo "✅ Todos os clusters e arquivos relacionados foram destruídos e limpos."

# chmod +x destroy-clusters.sh