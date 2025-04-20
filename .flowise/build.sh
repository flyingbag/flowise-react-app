#!/usr/bin/env bash

docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --build-arg MODULES="jsonpath mssql mustache" \
  -t flyingbag/flowise \
  --push \
  -f Dockerfile .