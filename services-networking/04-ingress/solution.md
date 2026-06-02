# Solution

```bash
kubectl -n ckaing create ingress app-ingress \
  --rule="demo.local/=web:80" \
  --rule="demo.local/api=api:80"

kubectl -n ckaing describe ingress app-ingress
```

Imperative `kubectl create ingress` with `--rule="host/path=svc:port"` is the fast path.
To actually serve traffic you'd install an ingress controller (e.g. ingress-nginx) and
point DNS/hosts at it.
