#!/bin/bash

if [[ $# -ne 4 ]]; then
    echo "Error: Incorrect number of arguments."
    echo "Usage: $0 <model> <lang> <input_audio_file> <output_srt_file>"
    exit 1
fi

model=$1
language=$2
input_file=$3
output_file=$4

additional_args=""
if [[ "$language" != "en" ]]; then
  additional_args="--translate"
fi

./whisper.cpp/main \
  --threads 8 \
  --model "./whisper.cpp/models/ggml-${model}.bin" \
  --file "$input_file" \
  --output-srt \
  --output-file "$output_file" \
  --language "$language" \
  --print-colors \
  $additional_args
