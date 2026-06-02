#!/bin/bash
set -e
kubectl create namespace ckanp --dry-run=client -o yaml | kubectl apply -f -
cat <<'EOF' | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata: {name: backend, namespace: ckanp}
spec:
  replicas: 1
  selector: {matchLabels: {app: backend}}
  template:
    metadata: {labels: {app: backend}}
    spec:
      containers: [{name: c, image: nginx:1.25, ports: [{containerPort: 80}]}]
---
apiVersion: v1
kind: Service
metadata: {name: backend, namespace: ckanp}
spec:
  selector: {app: backend}
  ports: [{port: 80, targetPort: 80}]
---
apiVersion: v1
kind: Pod
metadata: {name: frontend, namespace: ckanp, labels: {app: frontend}}
spec: {containers: [{name: c, image: busybox:1.28, command: ["sleep","36000"]}]}
---
apiVersion: v1
kind: Pod
metadata: {name: other, namespace: ckanp, labels: {app: other}}
spec: {containers: [{name: c, image: busybox:1.28, command: ["sleep","36000"]}]}
EOF
echo "Setup done. ckanp has backend(svc), frontend, and other pods."
sleep 5
