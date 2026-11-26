#!/usr/bin/env bash
# Build and install the X11-only KWin effect. Install the KWin X11 development
# dependencies for your distribution before running this script.
set -euo pipefail

base="$(cd "$(dirname "$0")" && pwd)"
build="$base/build"

cmake -S "$base" -B "$build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
cmake --build "$build" --parallel "$(nproc)"

if [[ $EUID -eq 0 ]]; then
    cmake --install "$build"
else
    sudo cmake --install "$build"
fi
