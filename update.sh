#!/bin/sh
# Brings this copy of the LDraw parts library up to date with the latest complete.zip from
# library.ldraw.org: replaces parts/ and p/, and LDConfig.ldr (the colours) and the license
# files beside them. It doesn't commit; check what changed with git status, then commit and push.
#
# Run with: ./update.sh

set -eu
cd "$(dirname "$0")"

work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT

echo "Downloading complete.zip…"
curl -fL --progress-bar -o "$work/complete.zip" https://library.ldraw.org/library/updates/complete.zip
unzip -q "$work/complete.zip" -d "$work"

rm -rf parts p
mv "$work/ldraw/parts" "$work/ldraw/p" .
for file in LDConfig.ldr CAreadme.txt CAlicense.txt CAlicense4.txt; do
  if [ -f "$work/ldraw/$file" ]; then cp "$work/ldraw/$file" .; fi
done

# Models name files in any case, and KineBrick asks for them in small letters, but the web server
# goes by the exact name: so every file and folder is named in small letters. (A name changed
# only in case goes by way of a temporary name, for file systems that ignore case.)
find parts p -depth -name '*[A-Z]*' | while IFS= read -r path; do
  dir=$(dirname "$path")
  lower=$(basename "$path" | tr 'A-Z' 'a-z')
  mv "$path" "$path.renaming"
  mv "$path.renaming" "$dir/$lower"
  echo "Renamed $path to $dir/$lower"
done

echo "Done: $(find parts p -type f | wc -l | tr -d ' ') files, $(head -4 LDConfig.ldr | grep -o 'UPDATE [0-9-]*')"
