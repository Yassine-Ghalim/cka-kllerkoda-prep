#!/bin/bash
# Drop the namespace (Deployment web goes with it).
kubectl delete namespace ckatbs --ignore-not-found
echo "Cleanup done. Namespace ckatbs removed."
