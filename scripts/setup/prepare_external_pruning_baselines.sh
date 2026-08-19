#!/usr/bin/env bash
set -euo pipefail

EXTERNAL_DIR="${1:-/workspace/virel_external}"
mkdir -p "$EXTERNAL_DIR"
cd "$EXTERNAL_DIR"

checkout_pinned() {
  local name="$1"
  local url="$2"
  local commit="$3"
  if [[ ! -d "$name/.git" ]]; then
    git clone --no-checkout "$url" "$name"
  fi
  git -C "$name" fetch --depth 1 origin "$commit"
  git -C "$name" checkout --detach "$commit"
  test "$(git -C "$name" rev-parse HEAD)" = "$commit"
}

checkout_pinned FastV https://github.com/chenllliang/FastV f95102a10acf31416f17ccf21b311c00d14ef49b
checkout_pinned SCOPE https://github.com/kinredon/SCOPE 6bf73069e0d61307051cfda8e25925bc7b7afdd9
checkout_pinned LLaVA-PruMerge https://github.com/42Shawn/LLaVA-PruMerge 8989c4304db1f8aa22627ae3191a4b61d0f0cd51

echo "Pinned external pruning repositories are available under $EXTERNAL_DIR"
