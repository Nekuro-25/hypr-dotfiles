#!/usr/bin/env bash
# =========================================================
# SCREENSHOT — grim + slurp (+ swappy untuk anotasi)
# =========================================================
# Pemakaian: screenshot.sh full | window | area | area-save | annotate
#
#   full       layar penuh      -> simpan + clipboard
#   window     jendela aktif    -> simpan + clipboard
#   area       pilih area       -> clipboard saja
#   area-save  pilih area       -> simpan + clipboard
#   annotate   pilih area       -> buka swappy
#
# Dibatalkan dengan Esc -> keluar diam-diam (tanpa notifikasi palsu,
# clipboard tidak ditimpa kosong).
# =========================================================

set -o pipefail # kegagalan grim di dalam pipe tidak lagi tertelan

dir="$HOME/Pictures/Screenshots"
mkdir -p "$dir"
file="$dir/$(date +%Y-%m-%d_%H-%M-%S).png"

# Seleksi memakai warna tema (ice blue night) + menampilkan dimensi
pick_area() { slurp -d -w 2 -b '#141d4888' -c '#a8c4ffff' -s '#5d80e422'; }

# notify JUDUL ISI [FILE-IKON]
notify() { notify-send -a Screenshot ${3:+-i "$3"} "$1" "$2"; }

case "$1" in
full)
	grim "$file" || exit 1
	wl-copy <"$file"
	notify "Screenshot saved" "Full screen captured" "$file"
	;;
window)
	geo=$(hyprctl activewindow -j | jq -r 'select(.address != null) | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
	[ -n "$geo" ] || exit 0
	grim -g "$geo" "$file" || exit 1
	wl-copy <"$file"
	notify "Screenshot saved" "Active window captured" "$file"
	;;
area)
	geo=$(pick_area) || exit 0
	grim -g "$geo" - | wl-copy || exit 1
	notify "Screenshot copied" "Area copied to clipboard"
	;;
area-save)
	geo=$(pick_area) || exit 0
	grim -g "$geo" "$file" || exit 1
	wl-copy <"$file"
	notify "Screenshot saved" "Area captured" "$file"
	;;
annotate)
	geo=$(pick_area) || exit 0
	grim -g "$geo" - | swappy -f -
	;;
*)
	echo "usage: $(basename "$0") full|window|area|area-save|annotate" >&2
	exit 2
	;;
esac
