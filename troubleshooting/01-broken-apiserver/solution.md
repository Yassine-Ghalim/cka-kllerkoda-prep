# Solution

1. `kubectl` fails, so go to the runtime on the controlplane:
   ```bash
   sudo crictl ps -a | grep apiserver        # find the exited apiserver container
   sudo crictl logs <container-id>           # error: invalid authorization-mode "RBACX"
   ```
   You can also check `sudo journalctl -u kubelet | tail`.

2. The static pod manifest has a bad flag value. Fix it:
   ```bash
   sudo vi /etc/kubernetes/manifests/kube-apiserver.yaml
   # change  --authorization-mode=Node,RBACX
   # back to --authorization-mode=Node,RBAC
   ```

3. kubelet re-reads the manifest and recreates the static pod automatically (~20-40s):
   ```bash
   watch sudo crictl ps | grep apiserver
   kubectl get nodes
   ```

Key lesson: control-plane components are static pods; when the API is down you debug
at the node level with `crictl` + `journalctl`, not `kubectl`.
