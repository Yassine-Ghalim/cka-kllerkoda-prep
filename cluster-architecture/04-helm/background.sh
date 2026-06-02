#!/bin/bash
set -e
if ! command -v helm >/dev/null 2>&1; then
  curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash || \
    echo "Could not install helm automatically; install it manually."
fi
kubectl create namespace ckahelm --dry-run=client -o yaml | kubectl apply -f -
mkdir -p /root/helm-task && cd /root/helm-task
[ -d webchart ] || helm create webchart >/dev/null 2>&1 || true
echo "Setup done. Helm is available and a scaffold chart exists at /root/helm-task/webchart."
sleep 2
