#!/usr/bin/env bash
# =========================================================
# DPMS (layar hidup/mati) untuk Hyprland 0.57+ (config Lua)
# Pemakaian: dpms.sh on | off
# =========================================================
# Catatan: dispatcher hl.dsp.dpms() menerima "on"/"off" (bukan
# "enable"/"disable"). "enable"/"disable" mengembalikan "ok"
# tanpa error, tapi tidak mengubah status layar — terverifikasi
# manual di Hyprland 0.57.1.
# =========================================================

case "$1" in
on) action="on" ;;
off) action="off" ;;
*)
	echo "usage: $(basename "$0") on|off" >&2
	exit 2
	;;
esac

exec hyprctl dispatch "hl.dsp.dpms({ action = \"$action\" })"
