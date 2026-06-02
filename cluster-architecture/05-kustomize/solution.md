# Solution

```bash
mkdir -p /root/kustomize-task/overlay
cat > /root/kustomize-task/overlay/kustomization.yaml <<'EOF'
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
namespace: ckakust
namePrefix: prod-
resources:
  - ../base
replicas:
  - name: web
    count: 3
images:
  - name: nginx
    newTag: "1.25"
EOF

kubectl kustomize /root/kustomize-task/overlay     # preview the rendered YAML
kubectl apply -k /root/kustomize-task/overlay
kubectl -n ckakust get deploy prod-web
```

`replicas:`, `images:`, `namePrefix`, and `namespace` are native Kustomize fields —
no patch file needed for these.
