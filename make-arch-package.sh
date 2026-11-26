#!/usr/bin/env bash
set -euo pipefail

base="$(cd "$(dirname "$0")" && pwd)"
config="$(mktemp)"
trap 'rm -f "$config"' EXIT

cp /etc/makepkg.conf "$config"
printf '\nBUILDDIR="%s/.makepkg"\n' "$base" >> "$config"

cd "$base"
makepkg --config "$config" --syncdeps "$@"
