#!/bin/bash
set -e
kubectl create namespace ckadrain --dry-run=client -o yaml | kubectl apply -f -
# Pin a couple of pods onto node01 so there is something to evict.
N=node01
cat <<EOF | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata: {name: drainme, namespace: ckadrain}
spec:
  replicas: 2
  selector: {matchLabels: {app: drainme}}
  template:
    metadata: {labels: {app: drainme}}
    spec:
      nodeName: $N
      containers: [{name: c, image: nginx:1.25}]
EOF
echo "Setup done. drainme pods are pinned to node01."
sleep 4
