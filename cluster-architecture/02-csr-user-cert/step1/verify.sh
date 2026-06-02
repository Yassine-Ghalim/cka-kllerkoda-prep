#!/bin/bash
cond=$(kubectl get csr jane -o jsonpath='{.status.conditions[?(@.type=="Approved")].status}' 2>/dev/null)
cert=$(kubectl get csr jane -o jsonpath='{.status.certificate}' 2>/dev/null)
canlist=$(kubectl auth can-i list pods --as=jane -n default 2>/dev/null)
if [ "$cond" = "True" ] && [ -n "$cert" ] && [ "$canlist" = "yes" ]; then
  echo "PASS: CSR jane approved+issued and jane can list pods."
  exit 0
fi
echo "FAIL: approved=$cond cert_present=$([ -n "$cert" ] && echo yes || echo no) can-list=$canlist"
exit 1
