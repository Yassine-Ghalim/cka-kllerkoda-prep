#!/bin/bash
# Make sure the apiserver manifest is back to a valid state, even if you didn't finish.
M=/etc/kubernetes/manifests/kube-apiserver.yaml
if grep -q 'authorization-mode=Node,RBACX' "$M" 2>/dev/null; then
  sed -i 's/--authorization-mode=Node,RBACX/--authorization-mode=Node,RBAC/' "$M"
  echo "Reverted the broken --authorization-mode flag; the kubelet will restart the apiserver."
else
  echo "apiserver manifest already valid; nothing to revert."
fi
echo "Cleanup done."
