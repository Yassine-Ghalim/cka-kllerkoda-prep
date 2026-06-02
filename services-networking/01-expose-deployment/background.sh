#!/bin/bash
set -e
kubectl create namespace ckanet --dry-run=client -o yaml | kubectl apply -f -
kubectl -n ckanet create deployment hello --image=nginx:1.25 --replicas=3 \
  --dry-run=client -o yaml | kubectl apply -f -
kubectl -n ckanet rollout status deploy/hello >/dev/null 2>&1 || true
echo "Setup done. Deployment hello/ckanet has 3 replicas."
sleep 3
