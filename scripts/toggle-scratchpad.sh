#!/usr/bin/env bash
# =========================================================
# TOGGLE SCRATCHPAD TERMINAL
# =========================================================
# Membuka kitty khusus (class "kitty-scratchpad") di special
# workspace "scratchpad", atau menampilkan/menyembunyikannya
# bila sudah berjalan.
#
# Hyprland 0.55+ (config Lua): isi `hyprctl dispatch` adalah
# ekspresi Lua, bukan sintaks lama "togglespecialworkspace x".
# =========================================================

CLASS="kitty-scratchpad"
WS="special:scratchpad"

has_window() {
    hyprctl clients -j 2>/dev/null | jq -e --arg c "$CLASS" 'any(.[]; .class == $c)' >/dev/null
}

is_visible() {
    hyprctl monitors -j 2>/dev/null | jq -e --arg w "$WS" 'any(.[]; .specialWorkspace.name == $w)' >/dev/null
}

toggle() {
    hyprctl dispatch 'hl.dsp.workspace.toggle_special("scratchpad")' >/dev/null
}

if has_window; then
    toggle
else
    setsid -f kitty --class "$CLASS" >/dev/null 2>&1

    # tunggu jendelanya muncul (maksimal sekitar 3 detik)
    for _ in $(seq 30); do
        has_window && break
        sleep 0.1
    done
    sleep 0.15

    # aturan jendela memindahkannya ke special workspace; tampilkan
    # hanya bila belum terlihat, supaya tidak langsung tersembunyi lagi
    is_visible || toggle
fi
