#!/bin/bash
ready=$(kubectl -n kube-system get deploy coredns -o jsonpath='{.status.readyReplicas}' 2>/dev/null)
if [ "${ready:-0}" -ge 1 ]; then
  if kubectl run dnstest --image=busybox:1.28 --rm -i --restart=Never -- \
       nslookup kubernetes.default.svc.cluster.local >/dev/null 2>&1; then
    echo "PASS: CoreDNS is up and resolving."
    exit 0
  fi
fi
echo "FAIL: coredns readyReplicas=${ready:-0} or DNS lookup failed."
exit 1
