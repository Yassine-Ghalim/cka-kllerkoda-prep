#!/bin/bash
# Drop the namespace (Pod fast-app goes with it). Also clear the label if you added it to a node.
kubectl delete namespace ckasched --ignore-not-found
kubectl label nodes --all disktype- 2>/dev/null || true
echo "Cleanup done. Namespace ckasched removed and disktype label cleared from nodes."
