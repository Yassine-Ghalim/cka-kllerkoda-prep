#!/bin/bash
set -e
kubectl create namespace ckaing --dry-run=client -o yaml | kubectl apply -f -
kubectl -n ckaing create deployment web --image=nginx:1.25 --dry-run=client -o yaml | kubectl apply -f -
kubectl -n ckaing create deployment api --image=nginx:1.25 --dry-run=client -o yaml | kubectl apply -f -
kubectl -n ckaing expose deployment web --port=80 --dry-run=client -o yaml | kubectl apply -f -
kubectl -n ckaing expose deployment api --port=80 --dry-run=client -o yaml | kubectl apply -f -
echo "Setup done. Services web and api (port 80) exist in ckaing."
sleep 3
