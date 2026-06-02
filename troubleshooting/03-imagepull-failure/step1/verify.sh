#!/bin/bash
avail=$(kubectl -n ckatbs get deploy web -o jsonpath='{.status.availableReplicas}' 2>/dev/null)
ready=$(kubectl -n ckatbs get deploy web -o jsonpath='{.status.readyReplicas}' 2>/dev/null)
if [ "${avail:-0}" -ge 3 ] && [ "${ready:-0}" -ge 3 ]; then
  echo "PASS: web has 3 ready replicas."
  exit 0
fi
echo "FAIL: ready=${ready:-0} available=${avail:-0} (need 3). Fix the image."
exit 1
