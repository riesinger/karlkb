#!/bin/zsh
# Description: Make the PCB file from the config.yaml file.
# Whenever the config.yaml file is modified, the PCB file is regenerated.
# If the "once" argument is passed, the PCB file is only generated once and
# the script exits.

set -e

# Check arguments
if [[ "$1" != "once" && "$1" != "" ]]; then
  echo "Usage: $0 [once]"
  exit 1
fi

OUTPUT_DIR=output
pcbnew="pcbnew"

if ! command "$pcbnew" >/dev/null 2>&1; then
  pcbnew="/Applications/KiCad/KiCad.app/Contents/Applications/pcbnew.app/Contents/MacOS/pcbnew"
fi

pcbnew_pid=

build() {
  echo "Building"
  node_modules/ergogen/src/cli.js . -o $OUTPUT_DIR &&
    {
      if [[ "$pcbnew_pid" ]]; then
        kill "$pcbnew_pid" || true
        rm -rf $OUTPUT_DIR/pcbs/\~main.kicad_pcb.lck
      fi
      "$pcbnew" $OUTPUT_DIR/pcbs/main.kicad_pcb &
      pcbnew_pid=$!
    } || true
}

build

if [[ "$1" == "once" ]]; then
  exit 0
fi

echo "Watching"
fswatch -o config.yaml footprints/ | while read; do
  build
done
