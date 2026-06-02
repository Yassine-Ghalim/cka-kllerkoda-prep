# HTTP routing with Ingress

Namespace **ckaing** has Services **web** and **api** (both port 80).

## Your task
Create an Ingress named **app-ingress** in `ckaing` for host **demo.local**:
- path **/**  -> Service **web**  port 80
- path **/api** -> Service **api** port 80

(Use `pathType: Prefix`.)
