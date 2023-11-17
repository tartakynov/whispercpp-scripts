#!/usr/bin/env bash

AUDIO_CAPTURE_DEVICE_ID=3

# Function to display usage information
usage() {
    echo "Usage: $0 [model]"
}

# Check if no arguments were provided
if [ $# -eq 0 ]; then
    usage
    exit 1
fi

./whisper.cpp/stream \
  -m "./whisper.cpp/models/ggml-$1.bin" \
  --capture "$AUDIO_CAPTURE_DEVICE_ID" \
  --threads 8 \
  --keep-context
