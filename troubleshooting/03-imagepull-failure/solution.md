# Solution

```bash
kubectl -n ckatbs describe pod -l app=web | grep -A3 Events   # 'Failed to pull image ... not found'
kubectl -n ckatbs set image deployment/web nginx=nginx:1.25
kubectl -n ckatbs rollout status deployment/web
kubectl -n ckatbs get pods
```

`describe` shows pull errors in Events; `kubectl set image` patches the container image
and triggers a rollout. (Container name defaults to the image name `nginx` here.)
