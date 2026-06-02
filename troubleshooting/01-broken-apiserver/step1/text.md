# Broken kube-apiserver

`kubectl` commands on the **controlplane** node are failing — the API server is not responding.

```
The connection to the server ...:6443 was refused
```

## Your task
Diagnose why the `kube-apiserver` static pod is not starting and **fix it** so that
`kubectl get nodes` works again.

Hints (don't peek unless stuck):
- Control-plane components run as **static pods** from `/etc/kubernetes/manifests/`.
- When the API server is down, `kubectl` can't help you — use the container runtime:
  `crictl ps -a`, `crictl logs <id>`, and `journalctl -u kubelet`.

Run `./verify` (or the Check button) when done.
