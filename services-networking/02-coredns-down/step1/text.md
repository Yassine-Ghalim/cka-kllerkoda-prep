# Cluster DNS is down

Pods can't resolve Service names:

```
nslookup kubernetes.default      # fails / times out
```

## Your task
Find why in-cluster DNS is failing and restore it so that name resolution works again.
A test pod resolving `kubernetes.default.svc.cluster.local` must succeed.
