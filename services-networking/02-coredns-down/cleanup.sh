#!/bin/bash
# Restore CoreDNS to its normal replica count (the setup scaled it to 0).
kubectl -n kube-system scale deployment coredns --replicas=2
kubectl -n kube-system rollout status deployment coredns 2>/dev/null || true
echo "Cleanup done. CoreDNS scaled back to 2 replicas."
