-- =========================================================
-- NOTIFICATION KEYBINDS
-- =========================================================
-- Controls for mako, following the same keyboard-first
-- philosophy as the rest of this config.
-- =========================================================

local mainMod = "SUPER"

-- SUPER + COMMA → Dismiss last notification
hl.bind(mainMod .. " + COMMA", hl.dsp.exec_cmd("makoctl dismiss"), {
    description = "Dismiss last notification",
})

-- SUPER + SHIFT + COMMA → Dismiss all notifications
hl.bind(mainMod .. " + SHIFT + COMMA", hl.dsp.exec_cmd("makoctl dismiss --all"), {
    description = "Dismiss all notifications",
})

-- SUPER + ALT + COMMA → Toggle do-not-disturb mode
hl.bind(mainMod .. " + ALT + COMMA", hl.dsp.exec_cmd("makoctl mode -t dnd"), {
    description = "Toggle do-not-disturb",
})
