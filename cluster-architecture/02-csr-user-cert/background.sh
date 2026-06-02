#!/bin/bash
set -e
command -v openssl >/dev/null || (apt-get update -y && apt-get install -y openssl)
mkdir -p /root/csr-task
echo "Setup done. Create the CSR for user 'jane' (workdir suggestion: /root/csr-task)."
sleep 2
