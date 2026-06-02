#!/bin/bash
# Make sure kubelet on node01 is running again, even if you didn't finish.
if ssh -o StrictHostKeyChecking=no -o ConnectTimeout=5 node01 "sudo systemctl start kubelet" 2>/dev/null; then
  echo "Started kubelet on node01."
else
  echo "Could not reach node01 over ssh. On a local cluster, start kubelet on the worker manually:"
  echo "  sudo systemctl start kubelet"
fi
echo "Cleanup done."
