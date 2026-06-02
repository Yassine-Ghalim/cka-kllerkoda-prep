#!/bin/bash
set -e
kubectl create namespace ckasvc --dry-run=client -o yaml | kubectl apply -f -
cat <<'EOF' | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: api
  namespace: ckasvc
spec:
  replicas: 2
  selector:
    matchLabels: {app: api}
  template:
    metadata:
      labels: {app: api}
    spec:
      containers:
        - name: api
          image: nginx:1.25
          ports: [{containerPort: 80}]
---
apiVersion: v1
kind: Service
metadata:
  name: api-svc
  namespace: ckasvc
spec:
  selector:
    app: apiserver        # WRONG: pods are labelled app=api
  ports:
    - port: 80
      targetPort: 8080    # WRONG: container listens on 80
EOF
echo "Setup done. Service api-svc/ckasvc is misconfigured."
sleep 3
