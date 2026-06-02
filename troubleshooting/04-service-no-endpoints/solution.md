# Solution

Two bugs: the selector doesn't match pod labels, and targetPort is wrong.

```bash
kubectl -n ckasvc get pods --show-labels      # pods are app=api
kubectl -n ckasvc describe svc api-svc         # selector app=apiserver, targetPort 8080
kubectl -n ckasvc edit svc api-svc
#   selector.app: apiserver -> api
#   ports[0].targetPort: 8080 -> 80
kubectl -n ckasvc get endpoints api-svc        # now lists 2 IPs
```

Reflex: **empty Endpoints = selector/label mismatch or wrong targetPort.**
