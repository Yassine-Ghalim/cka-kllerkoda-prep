#!/bin/bash
# Drop the namespace (Deployment api + Service api-svc go with it).
kubectl delete namespace ckasvc --ignore-not-found
echo "Cleanup done. Namespace ckasvc removed."
