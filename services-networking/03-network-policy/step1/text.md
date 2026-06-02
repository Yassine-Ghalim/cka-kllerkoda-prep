# Restrict backend traffic with a NetworkPolicy

Namespace **ckanp** has a `backend` Deployment+Service (port 80), plus two client
pods: **frontend** (`app=frontend`) and **other** (`app=other`).

## Your task
Create a NetworkPolicy named **backend-allow-frontend** in `ckanp` so that:
- pods with label **app=backend** accept ingress **only** from pods labelled
  **app=frontend**, on **TCP port 80**;
- all other ingress to backend (e.g. from `other`) is denied.
