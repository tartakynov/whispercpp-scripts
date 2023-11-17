#!/usr/bin/env bash

WHISPER_CPP_FOLDER=./whisper.cpp
MODEL=large

# Check if both input and output file locations are provided as arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <input_audio_file> <output_srt_file>"
    exit 1
fi

input_file="$1"
output_file="$2"

# Generate the srt file with whisper.cpp
"$WHISPER_CPP_FOLDER"/main \
  --threads 8 \
  --model "$WHISPER_CPP_FOLDER/models/ggml-$MODEL.bin" \
  --file "$input_file" \
  --output-srt \
  --output-file "$output_file" \
  --print-colors
