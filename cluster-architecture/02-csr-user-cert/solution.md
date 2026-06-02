# Solution

```bash
cd /root/csr-task
openssl genrsa -out jane.key 2048
openssl req -new -key jane.key -out jane.csr -subj "/CN=jane/O=dev"

cat <<EOF | kubectl apply -f -
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: jane
spec:
  request: $(cat jane.csr | base64 | tr -d '\n')
  signerName: kubernetes.io/kube-apiserver-client
  expirationSeconds: 86400
  usages: ["client auth"]
EOF

kubectl certificate approve jane
kubectl get csr jane                       # Approved,Issued

# RBAC for the CN 'jane'
kubectl create role pod-reader --verb=get,list,watch --resource=pods -n default
kubectl create rolebinding jane-reader --role=pod-reader --user=jane -n default
kubectl auth can-i list pods --as=jane -n default   # yes
```

Gotchas: `tr -d '\n'` on the base64; `signerName` must be the kube-apiserver-client
signer; the RBAC `--user` must equal the cert CN.
