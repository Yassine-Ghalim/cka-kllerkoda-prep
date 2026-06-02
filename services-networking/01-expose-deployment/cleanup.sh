#!/bin/bash
# Drop the namespace (Deployment hello + Service hello-svc go with it).
kubectl delete namespace ckanet --ignore-not-found
echo "Cleanup done. Namespace ckanet removed."
