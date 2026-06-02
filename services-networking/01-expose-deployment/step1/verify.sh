#!/bin/bash
typ=$(kubectl -n ckanet get svc hello-svc -o jsonpath='{.spec.type}' 2>/dev/null)
port=$(kubectl -n ckanet get svc hello-svc -o jsonpath='{.spec.ports[0].port}' 2>/dev/null)
ep=$(kubectl -n ckanet get endpoints hello-svc -o jsonpath='{.subsets[*].addresses[*].ip}' 2>/dev/null | wc -w)
if [ "$typ" = "ClusterIP" ] && [ "$port" = "80" ] && [ "$ep" -ge 3 ]; then
  echo "PASS: hello-svc ClusterIP:80 with $ep endpoints."
  exit 0
fi
echo "FAIL: type=$typ port=$port endpoints=$ep (want ClusterIP/80/>=3)."
exit 1
