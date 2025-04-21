#!/usr/bin/env bash
set -e

docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t flyingbag/flowise-react-app \
  --push \
  -f Dockerfile .