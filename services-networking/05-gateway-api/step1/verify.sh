#!/bin/bash
ns=ckagw
gw=$(kubectl -n $ns get gateway web-gw -o jsonpath='{.spec.listeners[0].port}' 2>/dev/null)
route_be=$(kubectl -n $ns get httproute web-route -o jsonpath='{.spec.rules[0].backendRefs[0].name}' 2>/dev/null)
route_parent=$(kubectl -n $ns get httproute web-route -o jsonpath='{.spec.parentRefs[0].name}' 2>/dev/null)
if [ "$gw" = "80" ] && [ "$route_be" = "web" ] && [ "$route_parent" = "web-gw" ]; then
  echo "PASS: Gateway web-gw:80 and HTTPRoute web-route -> web are configured."
  exit 0
fi
echo "FAIL: gw_port='$gw' route_backend='$route_be' route_parent='$route_parent'."
exit 1
