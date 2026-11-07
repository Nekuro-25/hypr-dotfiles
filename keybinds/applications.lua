-- =========================================================
-- APPLICATION KEYBINDS
-- =========================================================

local apps = require("config.apps")
local mainMod = "SUPER"

-- Jalankan aplikasi sebagai unit systemd (UWSM), bukan child compositor
local function app(cmd)
	return "uwsm app -- " .. cmd
end

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(app(apps.terminal)), {
	description = "Open terminal",
})

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(app(apps.fileManager)), {
	description = "Open file manager",
})

hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(app(apps.browser)), {
	description = "Open browser",
})

hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(apps.menu), {
	description = "Open application launcher",
})

hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"), {
	description = "Reload Hyprland config",
})
