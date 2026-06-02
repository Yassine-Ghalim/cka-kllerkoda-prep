#!/bin/bash
ep=$(kubectl -n ckasvc get endpoints api-svc -o jsonpath='{.subsets[*].addresses[*].ip}' 2>/dev/null)
cnt=$(echo $ep | wc -w)
if [ "$cnt" -ge 2 ]; then
  echo "PASS: api-svc has $cnt endpoints."
  exit 0
fi
echo "FAIL: api-svc has $cnt endpoints (need 2). Check selector + targetPort."
exit 1
