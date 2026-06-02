# ImagePullBackOff

The Deployment **web** in namespace **ckatbs** has 0 available replicas:

```
kubectl -n ckatbs get pods
# STATUS: ImagePullBackOff / ErrImagePull
```

## Your task
Diagnose the cause and fix the Deployment so that **all 3 replicas become Ready**.
Use a valid image: `nginx:1.25` (or `nginx:stable`).
