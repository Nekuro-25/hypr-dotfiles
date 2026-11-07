-- =========================================================
-- SCRATCHPAD KEYBIND
-- =========================================================
-- Toggle a dedicated floating terminal via special workspace.
-- Logic lives in scripts/toggle-scratchpad.sh.
-- =========================================================

hl.bind("SUPER + T", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/toggle-scratchpad.sh"), {
	description = "Toggle scratchpad terminal",
})
