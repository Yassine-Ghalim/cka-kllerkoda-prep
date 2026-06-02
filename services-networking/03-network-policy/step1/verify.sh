#!/bin/bash
ns=ckanp; np=backend-allow-frontend
exists=$(kubectl -n $ns get netpol $np -o name 2>/dev/null)
if [ -z "$exists" ]; then echo "FAIL: NetworkPolicy $np not found."; exit 1; fi
podsel=$(kubectl -n $ns get netpol $np -o jsonpath='{.spec.podSelector.matchLabels.app}' 2>/dev/null)
fromsel=$(kubectl -n $ns get netpol $np -o jsonpath='{.spec.ingress[0].from[0].podSelector.matchLabels.app}' 2>/dev/null)
port=$(kubectl -n $ns get netpol $np -o jsonpath='{.spec.ingress[0].ports[0].port}' 2>/dev/null)
if [ "$podsel" = "backend" ] && [ "$fromsel" = "frontend" ] && [ "$port" = "80" ]; then
  echo "PASS: policy selects app=backend, allows from app=frontend on port 80."
  # best-effort enforcement check (only meaningful on enforcing CNIs)
  if kubectl -n $ns exec frontend -- wget -qO- --timeout=3 backend >/dev/null 2>&1; then
    echo "  (frontend can reach backend - expected)"
  fi
  exit 0
fi
echo "FAIL: podSelector=$podsel from=$fromsel port=$port (want backend/frontend/80)."
exit 1
