#!/bin/sh

LFE_BIN="$PWD/LFE/lfe"

APNG="$1"
RES="$2"
GIF="$PWD/$(basename "$1.gif")"

FRAMERATE="$(grep --perl-regexp --only-matching '(?<="fr":)[[:digit:]]+' "$APNG")"
echo "Framerate is $FRAMERATE"

WORKDIR="$(mktemp -d)"
trap 'rm -rf "$WORKDIR"' EXIT

(
cd "$WORKDIR" || exit 1
"$LFE_BIN" "$APNG" "$RES"

ffmpeg -y -framerate "$FRAMERATE" -i "frame-%d.png" -filter_complex "[0:v] fps=50,split [a][b];[a] palettegen [p];[b][p] paletteuse" "intermediary.gif"

convert -dispose Background "intermediary.gif" "final.gif"
cp final.gif "$GIF"
echo "Done! Written to $GIF"
)
