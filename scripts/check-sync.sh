#!/usr/bin/env bash
#
# check-sync.sh — guard against drift between the two rule surfaces.
#
# references/*.md is the rule source of truth (detailed, English).
# SYSTEM_PROMPT.md is a derived, condensed Chinese port for platforms that
# cannot load files. The two files are written in different languages, so most
# of their content cannot be compared mechanically. But a handful of literal,
# language-neutral blocks (the negative-constraint strings) MUST stay byte
# identical between them. This script verifies exactly those blocks and exits
# non-zero on any mismatch, so drift is caught in review or CI.
#
# Usage: scripts/check-sync.sh

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CANON="$ROOT/references/negative.md"
PORT="$ROOT/SYSTEM_PROMPT.md"

# Unique substring anchoring each shared negative-constraint literal.
# Each anchor must select exactly one backtick-wrapped line in both files.
ANCHORS=(
  "low quality, blurry, muddy colors"                 # universal base
  "face hidden by hair, face hidden by glow"          # character-specific
  "extra couple, duplicated partner"                  # two-person
  "motion blur over face, weapon fused with hand"     # action
  "cheerful cute mood, bright theme-park palace"      # 逆仙黑暗
  "featureless fire blob, overexposed white flame"    # 斗破热血
  "plastic doll face, over-smoothed skin"             # 古风国漫通用
)

fail=0

extract() { # anchor, file -> the backtick-quoted literal on the single matching line
  local n
  n=$(grep -Fc -- "$1" "$2" || true)
  if [ "$n" -ne 1 ]; then
    echo "  ! anchor matched $n lines (expected 1) in $2"
    return 1
  fi
  # Keep only the text between the first and last backtick, ignoring any
  # Markdown list prefix (e.g. "- For two people:") that wraps the literal.
  grep -F -- "$1" "$2" | sed 's/^[^`]*`//;s/`[^`]*$//'
}

for anchor in "${ANCHORS[@]}"; do
  a=$(extract "$anchor" "$CANON") || { fail=1; continue; }
  b=$(extract "$anchor" "$PORT") || { fail=1; continue; }
  if [ "$a" != "$b" ]; then
    fail=1
    echo "DRIFT for anchor: $anchor"
    echo "  references/negative.md: $a"
    echo "  SYSTEM_PROMPT.md:       $b"
  fi
done

if [ "$fail" -ne 0 ]; then
  echo "check-sync: FAIL — reconcile SYSTEM_PROMPT.md against references/ (the source of truth)."
  exit 1
fi

echo "check-sync: OK — all shared negative-constraint blocks are in sync."
