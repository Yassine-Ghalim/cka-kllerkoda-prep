#!/usr/bin/env bash
# Local-cluster runner for the CKA practice scenarios.
#   ./cka.sh list                         # list scenarios
#   ./cka.sh setup  <domain/scenario>     # apply the broken/initial state
#   ./cka.sh verify <domain/scenario>     # check your solution
#   ./cka.sh solution <domain/scenario>   # print the walkthrough
#   ./cka.sh reset  <domain/scenario>     # re-run setup (idempotent)
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
cmd="${1:-help}"; path="${2:-}"
die(){ echo "$1" >&2; exit 1; }
case "$cmd" in
  list)
    find "$ROOT" -name index.json -printf '%h\n' | sed "s|$ROOT/||" | sort ;;
  setup|reset)
    [ -n "$path" ] || die "usage: ./cka.sh $cmd <domain/scenario>"
    [ -f "$ROOT/$path/background.sh" ] || die "no background.sh at $path"
    echo ">> setting up: $path"
    bash "$ROOT/$path/background.sh" ;;
  verify)
    [ -n "$path" ] || die "usage: ./cka.sh verify <domain/scenario>"
    [ -f "$ROOT/$path/step1/verify.sh" ] || die "no verify.sh at $path"
    bash "$ROOT/$path/step1/verify.sh" ;;
  solution)
    [ -n "$path" ] || die "usage: ./cka.sh solution <domain/scenario>"
    cat "$ROOT/$path/solution.md" ;;
  *)
    grep '^#' "$0" | sed 's/^# \{0,1\}//' | head -n 8 ;;
esac
