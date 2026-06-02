#!/bin/bash
set -e
kubectl -n kube-system scale deployment coredns --replicas=0
echo "Setup done. CoreDNS has been scaled to 0 — DNS resolution is broken."
sleep 5
