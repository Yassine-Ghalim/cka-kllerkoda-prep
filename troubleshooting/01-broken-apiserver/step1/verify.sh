#!/bin/bash
if kubectl get nodes >/dev/null 2>&1; then
  echo "PASS: API server is reachable again."
  exit 0
fi
echo "FAIL: API server still unreachable. Check /etc/kubernetes/manifests/kube-apiserver.yaml"
exit 1
