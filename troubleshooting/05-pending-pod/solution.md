# Solution

```bash
kubectl -n ckasched describe pod fast-app          # Events: 0/2 nodes match node selector
kubectl get nodes --show-labels | grep disktype    # none have disktype=ssd
# Honour the intent by labelling a node:
kubectl label node node01 disktype=ssd
kubectl -n ckasched get pod fast-app -w             # -> Running
```

Alternative valid fixes: remove the `nodeSelector` (if intent allows), or use
node affinity. For taints (another Pending cause) you'd add a matching toleration.
