#!/bin/bash
set -e
kubectl create namespace ckasched --dry-run=client -o yaml | kubectl apply -f -
cat <<'EOF' | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: fast-app
  namespace: ckasched
spec:
  nodeSelector:
    disktype: ssd          # no node has this label
  containers:
    - name: c
      image: nginx:1.25
EOF
echo "Setup done. Pod fast-app/ckasched is Pending."
sleep 3
