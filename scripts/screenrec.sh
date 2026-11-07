#!/usr/bin/env bash
# =========================================================
# SCREEN RECORDING — wf-recorder (toggle)
# =========================================================
# Pemakaian: screenrec.sh area | full
# Jalankan sekali untuk mulai, jalankan lagi untuk berhenti.
# Hasil: ~/Videos/Recordings/TANGGAL.mp4
# Tambah suara sistem/mic: tambahkan --audio pada wf-recorder di bawah.
# =========================================================

state="${XDG_RUNTIME_DIR:-/tmp}/screenrec.path"

if ! command -v wf-recorder >/dev/null 2>&1; then
    notify-send -a "Screen record" "wf-recorder belum terpasang" "Pasang paket wf-recorder dulu"
    exit 1
fi

# Sedang merekam -> hentikan
if pgrep -x wf-recorder >/dev/null; then
    pkill -INT -x wf-recorder
    notify-send -a "Screen record" "Rekaman disimpan" "$(cat "$state" 2>/dev/null)"
    exit 0
fi

dir="$HOME/Videos/Recordings"
mkdir -p "$dir"
file="$dir/$(date +%Y-%m-%d_%H-%M-%S).mp4"

args=()
if [ "${1:-area}" = "area" ]; then
    geo=$(slurp -d -w 2 -b '#141d4888' -c '#a8c4ffff' -s '#5d80e422') || exit 0
    args=(-g "$geo")
fi

echo "$file" > "$state"
notify-send -a "Screen record" "Merekam..." "Tekan pintasan yang sama untuk berhenti"
exec wf-recorder "${args[@]}" -f "$file"
