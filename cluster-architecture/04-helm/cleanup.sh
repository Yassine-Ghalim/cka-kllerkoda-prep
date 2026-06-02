#!/bin/bash
# Uninstall the Helm release, drop the namespace and the workdir.
helm -n ckahelm uninstall web 2>/dev/null || true
kubectl delete namespace ckahelm --ignore-not-found
rm -rf /root/helm-task
echo "Cleanup done. Release web, namespace ckahelm, and /root/helm-task removed."
