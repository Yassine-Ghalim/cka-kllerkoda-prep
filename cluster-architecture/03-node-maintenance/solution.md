# Solution

```bash
kubectl cordon node01
kubectl drain node01 --ignore-daemonsets --delete-emptydir-data
kubectl get nodes              # node01  Ready,SchedulingDisabled
kubectl -n ckadrain get pods -o wide   # rescheduled off node01
# after maintenance you would: kubectl uncordon node01
```

`cordon` marks unschedulable; `drain` evicts pods. `--ignore-daemonsets` is almost
always needed; add `--delete-emptydir-data` when pods use emptyDir.
