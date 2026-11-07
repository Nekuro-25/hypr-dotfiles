-- =========================================================
-- WORKSPACE KEYBINDS
-- =========================================================

local mainMod = "SUPER"

-- Organisasi workspace (harus sama dengan isi autostart.lua)
local workspaces = {
	[1] = "Browser",
	[2] = "Terminal",
	[3] = "Development",
	[4] = "Research",
	[5] = "Documents",
	[6] = "Files",
	[7] = "System",
	[8] = "Free",
	[9] = "Chat",
	[10] = "Music",
}

-- SUPER + 1..9 / 0 → Focus workspace
-- SUPER + SHIFT + 1..9 / 0 → Move window
for i = 1, 10 do
	local key = i % 10

	hl.bind(
		mainMod .. " + " .. key,
		hl.dsp.focus({
			workspace = i,
		}),
		{
			description = "Go to workspace " .. i .. " (" .. workspaces[i] .. ")",
		}
	)

	hl.bind(
		mainMod .. " + SHIFT + " .. key,
		hl.dsp.window.move({
			workspace = i,
		}),
		{
			description = "Move window to workspace " .. i .. " (" .. workspaces[i] .. ")",
		}
	)
end

-- Workspace 1-5 selalu tampil di Waybar walau kosong
for i = 1, 5 do
	hl.workspace_rule({
		workspace = tostring(i),
		persistent = true,
	})
end

-- SUPER + ] / [ → Workspace berikutnya / sebelumnya (yang terisi)
hl.bind(mainMod .. " + bracketright", hl.dsp.focus({ workspace = "e+1" }), {
	description = "Next workspace",
})

hl.bind(mainMod .. " + bracketleft", hl.dsp.focus({ workspace = "e-1" }), {
	description = "Previous workspace",
})

-- SUPER + SHIFT + ] / [ → Kirim jendela ke workspace berikutnya / sebelumnya
hl.bind(mainMod .. " + SHIFT + bracketright", hl.dsp.window.move({ workspace = "r+1" }), {
	description = "Move window to next workspace",
})

hl.bind(mainMod .. " + SHIFT + bracketleft", hl.dsp.window.move({ workspace = "r-1" }), {
	description = "Move window to previous workspace",
})

-- SUPER + TAB → Bolak-balik ke workspace sebelumnya
hl.bind(mainMod .. " + Tab", hl.dsp.focus({ workspace = "previous" }), {
	description = "Previous workspace (back-and-forth)",
})

-- SUPER + scroll mouse → Ganti workspace
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
