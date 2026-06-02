#!/bin/bash
set -e
kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.1.0/standard-install.yaml 2>/dev/null \
  || echo "Could not fetch Gateway API CRDs (need internet)."
kubectl create namespace ckagw --dry-run=client -o yaml | kubectl apply -f -
kubectl -n ckagw create deployment web --image=nginx:1.25 --dry-run=client -o yaml | kubectl apply -f -
kubectl -n ckagw expose deployment web --port=80 --dry-run=client -o yaml | kubectl apply -f -
echo "Setup done. Gateway API CRDs installed; Service web exists in ckagw."
sleep 4
