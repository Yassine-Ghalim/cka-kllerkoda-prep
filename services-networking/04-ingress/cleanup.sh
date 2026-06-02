#!/bin/bash
# Drop the namespace (Services web/api and any Ingress go with it).
kubectl delete namespace ckaing --ignore-not-found
echo "Cleanup done. Namespace ckaing removed."
