#!/bin/bash
set -e
kubectl create namespace ckac1 --dry-run=client -o yaml | kubectl apply -f -
kubectl -n ckac1 create serviceaccount app --dry-run=client -o yaml | kubectl apply -f -
echo "Setup done. ServiceAccount app exists in namespace ckac1."
sleep 2
