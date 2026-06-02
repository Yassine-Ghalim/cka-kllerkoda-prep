# Solution

```bash
cd /root/helm-task
helm install web ./webchart -n ckahelm --set replicaCount=2
helm -n ckahelm list
kubectl -n ckahelm get deploy
# inspect without installing:  helm template web ./webchart --set replicaCount=2
# upgrade:                     helm upgrade web ./webchart -n ckahelm --set replicaCount=3
# rollback:                    helm rollback web 1 -n ckahelm
```

For a remote chart the flow is the same after `helm repo add <name> <url> && helm repo update`,
then `helm install web <repo>/<chart> --version X -n ckahelm --set ...`.
