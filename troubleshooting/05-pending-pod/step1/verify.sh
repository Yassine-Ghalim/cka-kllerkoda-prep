#!/bin/bash
phase=$(kubectl -n ckasched get pod fast-app -o jsonpath='{.status.phase}' 2>/dev/null)
if [ "$phase" = "Running" ]; then
  echo "PASS: fast-app is Running."
  exit 0
fi
echo "FAIL: fast-app phase=${phase:-unknown}. Inspect the scheduling constraint."
exit 1
