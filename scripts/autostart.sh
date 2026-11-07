#!/bin/bash
# =========================================================
# AUTOSTART — daemon & service saja
# =========================================================
# Aplikasi (firefox, kitty, discord, spotify) diluncurkan dari
# config/autostart.lua lewat hl.exec_cmd(..., { workspace = "N silent" }).
# (Sintaks lama `hyprctl dispatch exec "[workspace N silent] ..."`
#  tidak berlaku di Hyprland 0.55+ yang memakai config Lua.)
#
# start() melewati program yang belum terpasang (tidak crash) dan
# tidak menjalankan duplikat bila skrip ini dipanggil ulang manual.
# =========================================================

have() { command -v "$1" >/dev/null 2>&1; }

# start PERINTAH [ARG...]
start() {
    if ! have "$1"; then
        echo "autostart: '$1' tidak ditemukan, dilewati" >&2
        return 0
    fi
    pgrep -fx -- "$*" >/dev/null 2>&1 && return 0
    setsid -f "$@" >/dev/null 2>&1
}

# 1. Wajib: sinkronisasi systemd & D-Bus environment untuk Wayland portals
dbus-update-activation-environment --systemd \
    WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE XDG_SESSION_DESKTOP

# 2. Daemons & services
start hyprpaper                 # wallpaper lebih dulu: tidak ada kedipan hitam
start waybar
start mako
start swayosd-server
start fcitx5 -d
start hypridle

# Clipboard: riwayat (maks 750 entri) + persist agar isi clipboard
# tidak hilang saat aplikasi sumber ditutup (wl-clip-persist opsional)
start wl-paste --type text  --watch cliphist -max-items 750 store
start wl-paste --type image --watch cliphist -max-items 750 store
start wl-clip-persist --clipboard regular

# Polkit agent (dialog password untuk aplikasi yang butuh root)
systemctl --user start hyprpolkitagent.service 2>/dev/null || true

# 3. Pastikan direktori screenshot & rekaman ada
mkdir -p "$HOME/Pictures/Screenshots" "$HOME/Videos/Recordings"
