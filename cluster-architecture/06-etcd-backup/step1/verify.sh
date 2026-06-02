#!/bin/bash
if [ -f /opt/etcd-backup.db ] && ETCDCTL_API=3 etcdctl snapshot status /opt/etcd-backup.db >/dev/null 2>&1; then
  echo "PASS: valid etcd snapshot at /opt/etcd-backup.db."
  exit 0
fi
echo "FAIL: /opt/etcd-backup.db missing or not a valid snapshot."
exit 1
