#!/bin/bash
# Drop the namespace (backend, frontend, other, and any NetworkPolicy go with it).
kubectl delete namespace ckanp --ignore-not-found
echo "Cleanup done. Namespace ckanp removed."
