# Gateway API routing

Namespace **ckagw** has a Service **web** (port 80) and the Gateway API CRDs are installed.

## Your task
1. Create a **Gateway** named **web-gw** in `ckagw` using `gatewayClassName: nginx`
   with an HTTP listener on **port 80**.
2. Create an **HTTPRoute** named **web-route** in `ckagw` that attaches to `web-gw`
   and forwards all traffic to Service **web** on port 80.
