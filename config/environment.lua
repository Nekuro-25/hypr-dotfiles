-- =========================================================
-- ENVIRONMENT (REFERENCE / PLACEHOLDER)
-- =========================================================
-- ⚠️  SEMUA baris di file ini SENGAJA dikomentari.
--
-- Environment variable aktif diatur oleh:
--     ~/.config/uwsm/env
--     ~/.config/uwsm/env-hyprland
-- yang diekspor oleh UWSM sebelum Hyprland dijalankan, sehingga
-- tidak perlu diduplikasi lewat hl.env() (dan menghindari race
-- antara config Lua dan env UWSM).
--
-- Autostart juga menjalankan
--     dbus-update-activation-environment --systemd \
--         WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE XDG_SESSION_DESKTOP
-- (lihat scripts/autostart.sh) agar xdg-desktop-portal-hyprland
-- bisa mengidentifikasi sesi dengan benar.
--
-- File ini dipertahankan sebagai referensi: nilai apa yang
-- dibutuhkan, dan mengapa. Kalau suatu saat kamu berhenti memakai
-- UWSM, cukup hapus komentar pada baris yang relevan di bawah.
-- =========================================================

-- hl.env("XCURSOR_SIZE", "24")
-- hl.env("HYPRCURSOR_SIZE", "24")

-- Required for xdg-desktop-portal-hyprland to identify the session
-- hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
-- hl.env("XDG_SESSION_TYPE", "wayland")
-- hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Force native Wayland backend for Qt apps
-- hl.env("QT_QPA_PLATFORM", "wayland;xcb")
-- hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
-- hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")

-- GTK: pakai Wayland dulu, jatuh ke X11 bila aplikasi belum mendukung
-- hl.env("GDK_BACKEND", "wayland,x11,*")

-- Force native Wayland backend for Electron apps (Discord, etc).
-- Diselaraskan dengan ~/.config/uwsm/env (mode "wayland").
-- hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")

-- Firefox native Wayland (not Electron, but same principle)
-- hl.env("MOZ_ENABLE_WAYLAND", "1")

-- Input method (fcitx5)
-- PENTING: jangan menulis `hl.env = { ... }` — itu menimpa fungsi hl.env.
-- hl.env("XMODIFIERS", "@im=fcitx")
-- hl.env("QT_IM_MODULE", "fcitx")
-- hl.env("GTK_IM_MODULE", "fcitx")
