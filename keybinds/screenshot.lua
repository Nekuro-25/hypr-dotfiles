-- =========================================================
-- SCREENSHOT, RECORDING & COLOR PICKER KEYBINDS
-- =========================================================
-- Logika ada di scripts/screenshot.sh dan scripts/screenrec.sh
-- (satu tempat untuk nama file, warna slurp, dan penanganan Esc).
-- =========================================================

local mainMod = "SUPER"
local shot = "~/.config/hypr/scripts/screenshot.sh"
local rec = "~/.config/hypr/scripts/screenrec.sh"

local binds = {
	{ "PRINT", shot .. " full", "Screenshot: full screen (save + copy)" },
	{ mainMod .. " + PRINT", shot .. " window", "Screenshot: active window (save + copy)" },
	{ mainMod .. " + SHIFT + S", shot .. " area", "Screenshot: area to clipboard" },
	{ mainMod .. " + SHIFT + PRINT", shot .. " area-save", "Screenshot: area, save + copy" },
	{ mainMod .. " + ALT + S", shot .. " annotate", "Screenshot: area with annotation" },

	-- Screen recording (toggle: tekan lagi untuk berhenti)
	{ mainMod .. " + CTRL + R", rec .. " area", "Record screen: area (toggle)" },
	{ mainMod .. " + CTRL + SHIFT + R", rec .. " full", "Record screen: full (toggle)" },

	-- Color picker → clipboard
	{
		mainMod .. " + SHIFT + C",
		"if command -v hyprpicker >/dev/null; then hyprpicker -a -n; "
			.. "else notify-send 'Color picker' 'hyprpicker belum terpasang'; fi",
		"Pick color to clipboard",
	},
}

for _, b in ipairs(binds) do
	hl.bind(b[1], hl.dsp.exec_cmd(b[2]), { description = b[3] })
end
