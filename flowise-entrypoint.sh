#!/bin/sh
set -e

MARKER="/usr/local/lib/node_modules/flowise/.modules_installed"
if [ ! -f "$MARKER" ]; then
  echo "Installing modules into Flowise workspace..."
  npm install $(echo "$TOOL_FUNCTION_EXTERNAL_DEP" | tr ',' ' ') \
    --prefix /usr/local/lib/node_modules/flowise \
    --save \
    --loglevel error
  touch "$MARKER"
else
  echo "Modules already installed; skipping installation."
fi

# Exec the official start command
exec flowise start