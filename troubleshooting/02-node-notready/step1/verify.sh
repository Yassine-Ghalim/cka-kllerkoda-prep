#!/bin/bash
status=$(kubectl get node node01 --no-headers 2>/dev/null | awk '{print $2}')
if [ "$status" = "Ready" ]; then
  echo "PASS: node01 is Ready."
  exit 0
fi
echo "FAIL: node01 status is '${status:-unknown}'. Bring the kubelet back up on node01."
exit 1
