#!/usr/bin/env bash
set -euo pipefail

OWNER=cloudflare
REPO=cloudflared
PACKAGE=cloudflared-linux-arm64.deb

METADATA=$(curl -H "Accept: application/vnd.github.v3+json" \
       https://api.github.com/repos/$OWNER/$REPO/releases/latest)

DOWNLOAD_URL=$(echo $METADATA | jq -r -c ".assets[] | select (.name == \"$PACKAGE\") | .browser_download_url")

curl -L --output $PACKAGE "$DOWNLOAD_URL"

