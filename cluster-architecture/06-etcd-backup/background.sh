#!/bin/bash
set -e
command -v etcdctl >/dev/null || (apt-get update -y && apt-get install -y etcd-client) || true
echo "Setup done. Take a snapshot to /opt/etcd-backup.db on the controlplane."
sleep 2
