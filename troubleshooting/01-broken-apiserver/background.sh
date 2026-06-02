#!/bin/bash
# Break the kube-apiserver static pod manifest with an invalid flag value.
set -e
M=/etc/kubernetes/manifests/kube-apiserver.yaml
if grep -q 'authorization-mode=Node,RBAC' "$M"; then
  sed -i 's/--authorization-mode=Node,RBAC/--authorization-mode=Node,RBACX/' "$M"
fi
echo "Setup done. The API server has been misconfigured."
sleep 8
