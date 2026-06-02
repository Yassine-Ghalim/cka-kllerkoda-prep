# Solution

```yaml
# backend-allow-frontend.yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: backend-allow-frontend
  namespace: ckanp
spec:
  podSelector:
    matchLabels: {app: backend}
  policyTypes: [Ingress]
  ingress:
    - from:
        - podSelector:
            matchLabels: {app: frontend}
      ports:
        - protocol: TCP
          port: 80
```

```bash
kubectl apply -f backend-allow-frontend.yaml
# On an enforcing CNI (Calico):
kubectl -n ckanp exec frontend -- wget -qO- --timeout=3 backend   # works
kubectl -n ckanp exec other    -- wget -qO- --timeout=3 backend   # times out (denied)
```

Selecting `app=backend` for Ingress switches it to default-deny for that direction;
the single `from` rule re-allows only `app=frontend`.
