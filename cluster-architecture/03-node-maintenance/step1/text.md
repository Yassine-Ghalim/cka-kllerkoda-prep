# Drain a node for maintenance

**node01** must be taken down for maintenance.

## Your task
1. **Cordon** node01 so no new pods schedule onto it.
2. **Drain** node01 so its workloads move elsewhere (ignore DaemonSets and delete
   emptyDir data if prompted).

After draining, node01 must show `SchedulingDisabled` and run no `drainme` pods.
