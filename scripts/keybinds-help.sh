#!/usr/bin/env bash
# =========================================================
# CHEAT SHEET KEYBIND
# =========================================================
# Membaca semua bind yang punya `description` langsung dari
# Hyprland (hyprctl binds -j), jadi daftar selalu sinkron dengan
# config. Tekan lagi (atau Esc) untuk menutup.
# =========================================================

if ! command -v jq >/dev/null 2>&1; then
    notify-send -a Hyprland "Keybinds" "jq belum terpasang"
    exit 1
fi

# Toggle: bila rofi sudah terbuka, tutup saja
pkill -x rofi && exit 0

hyprctl binds -j | jq -r '
  def has($m; $bit): ((($m / $bit) | floor) % 2) == 1;
  def mods($m):
    [ (if has($m; 64) then "SUPER" else empty end),
      (if has($m; 4)  then "CTRL"  else empty end),
      (if has($m; 8)  then "ALT"   else empty end),
      (if has($m; 1)  then "SHIFT" else empty end) ] | join(" + ");
  .[]
  | select((.description // "") != "")
  | (mods(.modmask)) as $m
  | (if $m == "" then .key else $m + " + " + .key end) + "\t" + .description
' | sort -u | { column -t -s "$(printf '\t')" 2>/dev/null || cat; } \
  | rofi -dmenu -i -p 'Keybinds' -no-custom
