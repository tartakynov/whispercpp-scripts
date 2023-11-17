#!/usr/bin/env bash

WHISPER_CPP_FOLDER=./whisper.cpp
MODEL=small.en
AUDIO_CAPTURE_DEVICE_ID=3

"$WHISPER_CPP_FOLDER"/stream \
  -m "$WHISPER_CPP_FOLDER/models/ggml-$MODEL.bin" \
  --capture "$AUDIO_CAPTURE_DEVICE_ID" \
  --threads 8 \
  --keep-context
