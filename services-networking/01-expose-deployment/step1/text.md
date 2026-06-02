# Expose a Deployment

Namespace **ckanet** has a Deployment **hello** (3 nginx replicas).

## Your task
Create a **ClusterIP** Service named **hello-svc** that exposes the deployment on
**port 80** (targetPort 80). It must have **3 endpoints**.
