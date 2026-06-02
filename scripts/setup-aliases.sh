#!/usr/bin/env bash
# Source this at the start of any session to work at exam speed:  source scripts/setup-aliases.sh
alias k=kubectl
export do="--dry-run=client -o yaml"
export now="--force --grace-period=0"
source <(kubectl completion bash) 2>/dev/null || true
complete -o default -F __start_kubectl k 2>/dev/null || true
echo "Aliases ready: k, \$do, \$now"
