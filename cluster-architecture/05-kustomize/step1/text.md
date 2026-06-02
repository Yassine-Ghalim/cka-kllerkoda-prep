# Customise with Kustomize

A base lives at **/root/kustomize-task/base** (Deployment `web`, 1 replica, nginx:1.24).

## Your task
Create an **overlay** at `/root/kustomize-task/overlay` that, on top of the base:
- sets **namespace** to `ckakust`
- adds **namePrefix** `prod-`
- sets **replicas** to `3`
- updates the image to **nginx:1.25**

Then apply it with `kubectl apply -k`.

Result: Deployment **prod-web** in `ckakust`, 3 replicas, image nginx:1.25.
