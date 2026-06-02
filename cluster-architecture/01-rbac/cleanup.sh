#!/bin/bash
# Remove everything this scenario created.
kubectl delete namespace ckac1 --ignore-not-found
echo "Cleanup done. Namespace ckac1 removed."
