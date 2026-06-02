#!/bin/bash
# Drop the namespace (and the prod-web Deployment in it) and the workdir.
kubectl delete namespace ckakust --ignore-not-found
rm -rf /root/kustomize-task
echo "Cleanup done. Namespace ckakust and /root/kustomize-task removed."
