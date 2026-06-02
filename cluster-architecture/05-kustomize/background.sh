#!/bin/bash
set -e
kubectl create namespace ckakust --dry-run=client -o yaml | kubectl apply -f -
mkdir -p /root/kustomize-task/base
cat > /root/kustomize-task/base/deployment.yaml <<'EOF'
apiVersion: apps/v1
kind: Deployment
metadata: {name: web}
spec:
  replicas: 1
  selector: {matchLabels: {app: web}}
  template:
    metadata: {labels: {app: web}}
    spec:
      containers: [{name: nginx, image: nginx:1.24}]
EOF
cat > /root/kustomize-task/base/kustomization.yaml <<'EOF'
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - deployment.yaml
EOF
echo "Setup done. Base manifests are at /root/kustomize-task/base."
sleep 2
