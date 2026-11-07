#!/usr/bin/env bash
# =========================================================
# DPMS (layar hidup/mati) untuk Hyprland 0.55+ (config Lua)
# Pemakaian: dpms.sh on | off
# =========================================================

case "$1" in
    on)  action="enable" ;;
    off) action="disable" ;;
    *)   echo "usage: $(basename "$0") on|off" >&2; exit 2 ;;
esac

exec hyprctl dispatch "hl.dsp.dpms({ action = \"$action\" })"
