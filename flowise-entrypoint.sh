#!/bin/sh
set -e

# Install desired modules into Flowise’s plugins directory
npm install $TOOL_FUNCTION_EXTERNAL_DEP \
  --prefix /usr/local/lib/node_modules/flowise \
  --save \
  --loglevel error

# Exec the official start command
exec flowise start