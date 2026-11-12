#!/data/data/com.termux/files/usr/bin/bash
set -e

SCRIPT_DIR="$(cd -- "$(dirname -- "$0")" && pwd)"
SOURCE="$SCRIPT_DIR/cordax.sh"
TARGET="$PREFIX/bin/cordax"

if [ ! -f "$SOURCE" ]; then
  echo "Error: $SOURCE not found"
  exit 1
fi

mkdir -p "$PREFIX/bin"
cp "$SOURCE" "$TARGET"
chmod +x "$TARGET"
echo "The acript is installed. Type cordax to run it"
