#!/bin/bash

# Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo "ffmpeg is not installed. Please install it and try again."
    exit 1
fi

# Check if both input and output file locations are provided as arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <input_video_file> <output_audio_file>"
    exit 1
fi

input_file="$1"
output_file="$2"

# Extract the audio track
ffmpeg -i "$input_file" -vn -c:a pcm_s16le -ac 1 -ar 16000 "$output_file"

if [ $? -eq 0 ]; then
    echo "Audio track extracted successfully to $output_file"
else
    echo "Error extracting audio track."
fi
