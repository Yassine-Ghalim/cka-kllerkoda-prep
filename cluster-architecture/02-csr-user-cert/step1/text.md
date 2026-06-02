# Onboard a user with a client certificate

A new user **jane** (group **dev**) needs cluster access via a client certificate.

## Your task
1. Generate a private key and a CSR with **CN=jane, O=dev**.
2. Submit it as a **CertificateSigningRequest named `jane`** with
   `signerName: kubernetes.io/kube-apiserver-client` and usage `client auth`.
3. **Approve** the CSR.
4. Create RBAC so **jane** can **get/list/watch pods** in the `default` namespace.

Verify with `kubectl auth can-i list pods --as=jane`.
