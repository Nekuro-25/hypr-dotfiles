#!/usr/bin/env bash
# =========================================================
# CAFFEINE — tahan layar tetap hidup
# =========================================================
# Mematikan hypridle (tanpa dim/lock/dpms/suspend otomatis),
# atau menyalakannya lagi. Kunci manual tetap berfungsi.
# =========================================================

if pgrep -x hypridle >/dev/null; then
    pkill -x hypridle
    notify-send -a Caffeine "Caffeine ON" "Layar tidak akan redup, terkunci, atau suspend otomatis"
else
    setsid -f hypridle >/dev/null 2>&1
    notify-send -a Caffeine "Caffeine OFF" "Auto-lock & suspend aktif kembali"
fi
