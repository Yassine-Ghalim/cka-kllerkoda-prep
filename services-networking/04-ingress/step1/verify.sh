#!/bin/bash
ns=ckaing
host=$(kubectl -n $ns get ingress app-ingress -o jsonpath='{.spec.rules[0].host}' 2>/dev/null)
paths=$(kubectl -n $ns get ingress app-ingress -o jsonpath='{range .spec.rules[0].http.paths[*]}{.path}={.backend.service.name}:{.backend.service.port.number} {end}' 2>/dev/null)
echo "$paths" | grep -q "/=web:80" && echo "$paths" | grep -q "/api=api:80" && [ "$host" = "demo.local" ]
if [ $? -eq 0 ]; then
  echo "PASS: ingress routes demo.local / -> web, /api -> api."
  exit 0
fi
echo "FAIL: host='$host' paths='$paths'."
exit 1
