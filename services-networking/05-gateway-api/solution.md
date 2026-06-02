# Solution

```yaml
apiVersion: gateway.networking.k8s.io/v1
kind: Gateway
metadata: {name: web-gw, namespace: ckagw}
spec:
  gatewayClassName: nginx
  listeners:
    - name: http
      protocol: HTTP
      port: 80
---
apiVersion: gateway.networking.k8s.io/v1
kind: HTTPRoute
metadata: {name: web-route, namespace: ckagw}
spec:
  parentRefs:
    - name: web-gw
  rules:
    - backendRefs:
        - name: web
          port: 80
```

```bash
kubectl apply -f gw.yaml
kubectl -n ckagw get gateway,httproute
```

Object relationship to remember: **GatewayClass** (controller) <- **Gateway** (listener)
<- **HTTPRoute** (rules -> backend Service). Real traffic requires a Gateway controller
implementing `gatewayClassName: nginx`.
