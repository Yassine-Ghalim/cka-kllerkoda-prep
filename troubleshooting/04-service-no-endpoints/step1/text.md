# Service with no endpoints

In namespace **ckasvc**, Service **api-svc** never serves traffic:

```
kubectl -n ckasvc get endpoints api-svc      # <none>
```

## Your task
Make **api-svc** correctly route to the `api` pods on port 80.
After your fix, `kubectl -n ckasvc get endpoints api-svc` must list 2 pod IPs.
