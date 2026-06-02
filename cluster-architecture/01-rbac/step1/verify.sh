#!/bin/bash
SA=system:serviceaccount:ckac1:app
can_list=$(kubectl auth can-i list pods --as=$SA -n ckac1 2>/dev/null)
can_get=$(kubectl auth can-i get pods --as=$SA -n ckac1 2>/dev/null)
cannot_del=$(kubectl auth can-i delete pods --as=$SA -n ckac1 2>/dev/null)
if [ "$can_list" = "yes" ] && [ "$can_get" = "yes" ] && [ "$cannot_del" = "no" ]; then
  echo "PASS: app can read pods but not delete them."
  exit 0
fi
echo "FAIL: list=$can_list get=$can_get delete=$cannot_del (want yes/yes/no)."
exit 1
