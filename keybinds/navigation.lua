-- =========================================================
-- NAVIGATION KEYBINDS
-- =========================================================
-- Fokus / pindah / resize jendela. Mendukung tombol vim (HJKL)
-- DAN tombol panah.
-- =========================================================

local mainMod = "SUPER"
local resizeStep = 30

-- { tombol vim, tombol panah, arah, dx resize, dy resize }
local directions = {
	{ "H", "Left", "left", -1, 0 },
	{ "J", "Down", "down", 0, 1 },
	{ "K", "Up", "up", 0, -1 },
	{ "L", "Right", "right", 1, 0 },
}

for _, d in ipairs(directions) do
	local vim, arrow, name, dx, dy = d[1], d[2], d[3], d[4], d[5]

	for _, key in ipairs({ vim, arrow }) do
		-- SUPER + H/J/K/L (atau panah) → Focus window
		hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ direction = name }), {
			description = "Focus " .. name,
		})

		-- SUPER + SHIFT + H/J/K/L (atau panah) → Move window
		hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ direction = name }), {
			description = "Move window " .. name,
		})

		-- SUPER + CTRL + H/J/K/L (atau panah) → Resize window (tahan = terus)
		hl.bind(
			mainMod .. " + CTRL + " .. key,
			hl.dsp.window.resize({
				x = dx * resizeStep,
				y = dy * resizeStep,
				relative = true,
			}),
			{
				repeating = true,
				description = "Resize window " .. name,
			}
		)
	end
end
