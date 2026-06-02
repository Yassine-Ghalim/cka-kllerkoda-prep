#!/bin/bash
# Remove the CSR, the RBAC you may have created for jane, and the workdir.
kubectl delete csr jane --ignore-not-found
kubectl -n default delete role pod-reader --ignore-not-found
kubectl -n default delete rolebinding jane-reader --ignore-not-found
rm -rf /root/csr-task
echo "Cleanup done. CSR jane, jane RBAC, and /root/csr-task removed."
