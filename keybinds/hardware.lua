-- =========================================================
-- HARDWARE KEYBINDS
-- =========================================================
-- Volume/brightness handled via swayosd-client, which calls
-- wpctl/brightnessctl internally AND shows the OSD popup.
-- repeating = true → menahan tombol terus menaikkan/menurunkan.
-- =========================================================

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume raise"), {
	description = "Volume up",
	locked = true,
	repeating = true,
})

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume lower"), {
	description = "Volume down",
	locked = true,
	repeating = true,
})

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"), {
	description = "Toggle mute",
	locked = true,
})

hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"), {
	description = "Toggle mic mute",
	locked = true,
})

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("swayosd-client --brightness raise"), {
	description = "Brightness up",
	locked = true,
	repeating = true,
})

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("swayosd-client --brightness lower"), {
	description = "Brightness down",
	locked = true,
	repeating = true,
})

-- SUPER + I → Tampilkan/sembunyikan panel CPU, RAM, suhu di Waybar
hl.bind("SUPER + I", hl.dsp.exec_cmd("$HOME/.config/waybar/scripts/toggle-hardware.sh"), {
	description = "Toggle hardware panel",
})
