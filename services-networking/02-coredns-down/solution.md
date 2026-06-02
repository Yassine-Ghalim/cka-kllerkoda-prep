# Solution

```bash
kubectl -n kube-system get deploy coredns      # READY 0/0
kubectl -n kube-system scale deployment coredns --replicas=2
kubectl -n kube-system get pods -l k8s-app=kube-dns -w
# test
kubectl run t --image=busybox:1.28 --rm -it --restart=Never -- nslookup kubernetes.default
```

Other real CoreDNS failures: a broken `Corefile` (`kubectl -n kube-system get cm coredns -o yaml`),
or pods stuck Pending due to taints.
