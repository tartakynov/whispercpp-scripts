#!/usr/bin/env bash

# Check if both input and output file locations are provided as arguments
if [ $# -ne 3 ]; then
    echo "Usage: $0 <model> <input_audio_file> <output_srt_file>"
    exit 1
fi

# Generate the srt file with whisper.cpp
./whisper.cpp/main \
  --threads 8 \
  --model "./whisper.cpp/models/ggml-$1.bin" \
  --file "$2" \
  --output-srt \
  --output-file "$3" \
  --print-colors
