# Solution

```bash
kubectl -n ckanet expose deployment hello \
  --name=hello-svc --port=80 --target-port=80 --type=ClusterIP

kubectl -n ckanet get svc hello-svc
kubectl -n ckanet get endpoints hello-svc      # 3 pod IPs
# quick test:
kubectl -n ckanet run t --image=busybox:1.28 --rm -it --restart=Never -- wget -qO- hello-svc
```
