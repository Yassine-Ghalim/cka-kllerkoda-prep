# Solution

```bash
kubectl -n ckac1 create role pod-reader \
  --verb=get,list,watch --resource=pods

kubectl -n ckac1 create rolebinding app-pod-reader \
  --role=pod-reader --serviceaccount=ckac1:app

# verify
kubectl auth can-i list pods   --as=system:serviceaccount:ckac1:app -n ckac1   # yes
kubectl auth can-i delete pods --as=system:serviceaccount:ckac1:app -n ckac1   # no
```

A **Role** + **RoleBinding** scope the grant to one namespace. Using a ClusterRole
or ClusterRoleBinding would over-grant.
