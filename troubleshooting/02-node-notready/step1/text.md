# Node NotReady

```
kubectl get nodes
NAME           STATUS     ROLES           AGE   VERSION
controlplane   Ready      control-plane   ...   ...
node01         NotReady   <none>          ...   ...
```

## Your task
Find out why **node01** is `NotReady` and make it `Ready` again.

Hints:
- `kubectl describe node node01` shows the Conditions.
- The kubelet is the node agent. SSH to the node and inspect it:
  `ssh node01`, then `systemctl status kubelet`, `journalctl -u kubelet`.
