# RBAC: least-privilege for a ServiceAccount

In namespace **ckac1** there is a ServiceAccount **app**.

## Your task
Grant the ServiceAccount `ckac1:app` permission to **get, list, and watch Pods**
in the **ckac1** namespace only. It must **not** be able to delete pods or access
other namespaces.

Verify your own work with `kubectl auth can-i ... --as=system:serviceaccount:ckac1:app`.
