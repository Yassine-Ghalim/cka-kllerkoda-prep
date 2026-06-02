#!/bin/bash
set -e
# Stop kubelet on node01 to make it NotReady. Fall back gracefully if ssh not available.
if ssh -o StrictHostKeyChecking=no -o ConnectTimeout=5 node01 "sudo systemctl stop kubelet" 2>/dev/null; then
  echo "Stopped kubelet on node01."
else
  echo "Could not reach node01 over ssh. On a local cluster, stop kubelet on the worker manually:"
  echo "  sudo systemctl stop kubelet"
fi
sleep 10
