#!/usr/bin/env bash

source config.sh

"$WHISPER_CPP_FOLDER"/stream \
  -m "$WHISPER_CPP_FOLDER/models/ggml-$MODEL.bin" \
  --capture 3 \
  --threads 8 \
  --step 500 \
  --length 5000
