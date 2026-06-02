#!/bin/bash
set -e
kubectl create namespace ckatbs --dry-run=client -o yaml | kubectl apply -f -
kubectl -n ckatbs create deployment web --image=nginx:doesnotexist-1.0 --replicas=3 \
  --dry-run=client -o yaml | kubectl apply -f -
echo "Setup done. Deployment web/ckatbs is failing to pull its image."
sleep 3
