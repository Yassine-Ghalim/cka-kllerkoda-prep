#!/bin/bash
# Bring node01 back into service and remove the workload.
kubectl uncordon node01 2>/dev/null || true
kubectl delete namespace ckadrain --ignore-not-found
echo "Cleanup done. node01 uncordoned and namespace ckadrain removed."
