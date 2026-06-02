# CKA Practice Scenarios — Killercoda + Local Cluster

Hands-on, killer.sh-style practice for the three highest-weight CKA domains
(**75% of the exam**): Troubleshooting, Cluster Architecture/Install/Config, and
Services & Networking. Each scenario sets up a realistic broken/initial state,
gives you a task, and ships a **verifier** and a full **solution**.

Every scenario runs in two places:

1. **Killercoda** (free hosted 2-node cluster) — push this repo to GitHub, connect it
   in your Killercoda Creators account, and each folder becomes a playable scenario.
2. **Your local cluster** — use the `./cka.sh` runner (no Killercoda needed).

## Scenario catalogue

### Troubleshooting (30%)

| # | Scenario | Folder |
|---|---|---|
| 1 | kube-apiserver won't start | `troubleshooting/01-broken-apiserver` |
| 2 | worker node NotReady | `troubleshooting/02-node-notready` |
| 3 | Deployment stuck ImagePullBackOff | `troubleshooting/03-imagepull-failure` |
| 4 | Service has no endpoints | `troubleshooting/04-service-no-endpoints` |
| 5 | Pod stuck Pending (scheduling) | `troubleshooting/05-pending-pod` |

### Cluster Architecture, Installation & Configuration (25%)

| # | Scenario | Folder |
|---|---|---|
| 1 | RBAC for a ServiceAccount | `cluster-architecture/01-rbac` |
| 2 | create & approve a user certificate (CSR) | `cluster-architecture/02-csr-user-cert` |
| 3 | drain a node for maintenance | `cluster-architecture/03-node-maintenance` |
| 4 | install an app with Helm | `cluster-architecture/04-helm` |
| 5 | customise a base with Kustomize | `cluster-architecture/05-kustomize` |
| 6 | back up etcd | `cluster-architecture/06-etcd-backup` |

### Services & Networking (20%)

| # | Scenario | Folder |
|---|---|---|
| 1 | expose a Deployment | `services-networking/01-expose-deployment` |
| 2 | cluster DNS is broken | `services-networking/02-coredns-down` |
| 3 | lock down traffic with a NetworkPolicy | `services-networking/03-network-policy` |
| 4 | route HTTP with an Ingress | `services-networking/04-ingress` |
| 5 | Gateway API | `services-networking/05-gateway-api` |

> Some scenarios note prerequisites (kubeadm static pods, a NetworkPolicy-enforcing
> CNI like Calico, or one-time internet for Helm/Gateway CRDs). See each scenario's
> `intro.md`.

## Use it on your LOCAL cluster

```bash
# work at exam speed
source scripts/setup-aliases.sh

./cka.sh list                                          # see all scenarios
./cka.sh setup  troubleshooting/04-service-no-endpoints  # create the broken state
#   ... solve it in your terminal ...
./cka.sh verify troubleshooting/04-service-no-endpoints  # PASS/FAIL
./cka.sh solution troubleshooting/04-service-no-endpoints  # walkthrough
```

`setup` is idempotent, so it doubles as `reset`. Scenarios that change node/control-plane
state (e.g. `01-broken-apiserver`, `02-node-notready`) assume a **kubeadm** cluster with
`systemctl`/`crictl` access — run those on a disposable cluster, not production.

## Use it on KILLERCODA

1. Push this repo to your own GitHub (public).
2. Sign in at killercoda.com -> **Creators** -> **Manage Git Repositories** -> add the repo.
3. Killercoda scans for any directory containing an `index.json` and publishes it as a
   scenario. Open one and the cluster boots with the task already set up.

Each `index.json` uses `backend.imageid: kubernetes-kubeadm-2nodes` (a real 2-node kubeadm cluster:
`controlplane` + `node01`), so node-level and control-plane scenarios work as on the exam.

## Scenario anatomy

```
<domain>/<scenario>/
├── index.json          # Killercoda config (intro/steps/finish + backend)
├── intro.md            # landing page + prerequisites
├── background.sh       # setup: builds the broken/initial state (runs at start)
├── step1/
│   ├── text.md         # the task
│   └── verify.sh       # validation (exit 0 = pass; this is the Check button)
├── finish.md           # completion page
└── solution.md         # full walkthrough (peek only when stuck)
```

## Suggested study loop
Pick a scenario -> `setup` -> solve under a timer (~7 min, exam pace) -> `verify` ->
read `solution.md` only after. Re-run anything you miss until it's automatic.

---
*Practice cluster only. The break scripts intentionally damage cluster state.*
