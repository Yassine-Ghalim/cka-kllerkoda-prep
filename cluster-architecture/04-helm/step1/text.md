# Deploy with Helm

A scaffold chart exists at **/root/helm-task/webchart**.

## Your task
Using Helm, install it as a release named **web** in namespace **ckahelm**,
overriding the replica count to **2** (`--set replicaCount=2`).

After install, `helm -n ckahelm list` shows `web`, and the chart's Deployment
has 2 replicas.
