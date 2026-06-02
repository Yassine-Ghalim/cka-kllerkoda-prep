#!/bin/bash
sched=$(kubectl get node node01 -o jsonpath='{.spec.unschedulable}' 2>/dev/null)
left=$(kubectl -n ckadrain get pods -o wide --no-headers 2>/dev/null | awk '$7=="node01"' | wc -l)
if [ "$sched" = "true" ] && [ "$left" -eq 0 ]; then
  echo "PASS: node01 cordoned and drained."
  exit 0
fi
echo "FAIL: unschedulable=$sched, drainme pods still on node01=$left."
exit 1
