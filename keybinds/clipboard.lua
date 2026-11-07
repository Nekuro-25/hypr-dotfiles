-- =========================================================
-- CLIPBOARD KEYBINDS
-- =========================================================
-- Riwayat cliphist lewat Rofi (tema: ~/.config/rofi/clipboard.rasi).
-- Kolom ID disembunyikan (-display-columns 2); baris aslinya tetap
-- diteruskan ke "cliphist decode".
--
-- Separator pakai $(printf '\t') -> tab literal (POSIX-safe).
-- Tidak bergantung pada rofi menafsirkan escape "\t".
--
-- Pilihan ditangkap ke variabel "sel" dan dicek tidak kosong.
-- Menekan Esc tidak lagi meneruskan input kosong ke wl-copy.
--
-- NOTE: SUPER + V sudah dipakai "toggle floating" (window.lua).
-- =========================================================

local mainMod = "SUPER"

-- SUPER + PERIOD → Open clipboard history picker
hl.bind(
	mainMod .. " + PERIOD",
	hl.dsp.exec_cmd(
		[[sel=$(cliphist list | rofi -dmenu -i -p 'Clipboard' ]]
			.. [[-theme "$HOME/.config/rofi/clipboard.rasi" ]]
			.. [[-display-columns 2 -display-column-separator "$(printf '\t')") ]]
			.. [[&& [ -n "$sel" ] && printf '%s' "$sel" | cliphist decode | wl-copy]]
	),
	{
		description = "Open clipboard history",
	}
)

-- SUPER + SHIFT + PERIOD → Clear clipboard history
hl.bind(mainMod .. " + SHIFT + PERIOD", hl.dsp.exec_cmd("cliphist wipe && notify-send 'Clipboard' 'History cleared'"), {
	description = "Clear clipboard history",
})
