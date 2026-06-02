# Solution

```bash
kubectl describe node node01            # Conditions show kubelet stopped posting status
ssh node01
sudo systemctl status kubelet           # inactive (dead)
sudo systemctl start kubelet
sudo systemctl enable kubelet
sudo journalctl -u kubelet -f           # confirm it's healthy
exit
kubectl get nodes                       # node01 -> Ready
```

If the kubelet won't start, common real causes: container runtime down
(`systemctl status containerd`), swap re-enabled (`swapoff -a`), or a bad
`/var/lib/kubelet/config.yaml` / expired certs.
