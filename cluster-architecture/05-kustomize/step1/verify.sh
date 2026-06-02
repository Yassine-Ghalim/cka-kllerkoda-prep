#!/bin/bash
reps=$(kubectl -n ckakust get deploy prod-web -o jsonpath='{.spec.replicas}' 2>/dev/null)
img=$(kubectl -n ckakust get deploy prod-web -o jsonpath='{.spec.template.spec.containers[0].image}' 2>/dev/null)
if [ "${reps:-0}" -eq 3 ] && [ "$img" = "nginx:1.25" ]; then
  echo "PASS: prod-web in ckakust has 3 replicas, image $img."
  exit 0
fi
echo "FAIL: replicas='${reps:-none}' image='${img:-none}' (want 3 / nginx:1.25)."
exit 1
