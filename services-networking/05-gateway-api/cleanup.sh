#!/bin/bash
# Drop the namespace (Service web, Gateway, HTTPRoute go with it).
# The Gateway API CRDs are left installed (they are cluster-wide and harmless).
kubectl delete namespace ckagw --ignore-not-found
echo "Cleanup done. Namespace ckagw removed (Gateway API CRDs left in place)."
