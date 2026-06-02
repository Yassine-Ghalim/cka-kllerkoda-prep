#!/bin/bash
rel=$(helm -n ckahelm list -q 2>/dev/null | grep -w web)
reps=$(kubectl -n ckahelm get deploy -o jsonpath='{.items[0].spec.replicas}' 2>/dev/null)
if [ "$rel" = "web" ] && [ "${reps:-0}" -eq 2 ]; then
  echo "PASS: helm release web installed with 2 replicas."
  exit 0
fi
echo "FAIL: release='$rel' replicas='${reps:-none}' (want web / 2)."
exit 1
