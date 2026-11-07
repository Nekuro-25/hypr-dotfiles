-- =========================================================
-- MEDIA KEYBINDS
-- =========================================================

-- Next track
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), {
    locked = true,
    description = "Next track",
})

-- Play / pause
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), {
    locked = true,
    description = "Play / pause",
})

-- Pause
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl pause"), {
    locked = true,
    description = "Pause",
})

-- Previous track
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), {
    locked = true,
    description = "Previous track",
})
