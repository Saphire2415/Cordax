#!/data/data/com.termux/files/usr/bin/bash
set -e

TARGET="$PREFIX/bin/cordax"

if [ -f "$TARGET" ]; then
  rm -f "$TARGET"
  hash -r
  echo "Cordax has been uninstalled."
else
  echo "Cordax is not installed at $TARGET"
fi
