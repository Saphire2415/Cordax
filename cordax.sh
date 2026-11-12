#!/data/data/com.termux/files/usr/bin/bash

cat > install-cordax.sh <<'EOF'
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
echo "Installed. Type: cordax"
EOF

required=(toilet lolcat termux-notification)

for cmd in "${required[@]}"; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    printf '%s is missing. Install it with: pkg install %s\n' "$cmd" "$cmd"
    exit 1
  fi
done

clear
toilet -f mono9 "CORDAX" | lolcat

printf "\033[31mWelcome to CORDAX, a tiny script that acts like a virus.\033[0m\n"
printf "\033[35mEpilepsy warning!\033[0m\n"

read -r -p "Continue? (Y/N): " answer

if [[ "$answer" == "Y" || "$answer" == "y" ]]; then
  tput civis
  trap '' INT

  DIGITS=11
  colors=(31 32 33 34 35 36 91 92 93 94 95 96)

  while true; do

    color=${colors[RANDOM % ${#colors[@]}]}
    printf '\033[%smCORDAX CORDAX CORDAX CORDAX CORDAX CORDAX ' "$color"

    for ((i = 0; i < DIGITS; i++)); do
      printf '%s' "$((RANDOM % 2))"
    done

    printf '\033[0m\n'
    sleep 0.01
  done &

  while true; do
    termux-notification --title "CORDAX" --content "CORDAX CORDAX CORDAX"
  done &
elif [[ "$answer" == "N" || "$answer" == "n" ]]; then
  echo "You chose No."
else
  echo "Please enter Y or N."
fi


