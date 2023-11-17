#!/bin/bash

# Function to display usage information
usage() {
    echo "Usage: $0 <model>"
}

# Check if no arguments were provided
if [ $# -eq 0 ]; then
    usage
    exit 1
fi

cd whisper.cpp

./models/download-ggml-model.sh $1

python3 -m venv venv
pip install ane_transformers openai-whisper coremltools
source venv/bin/activate

./models/generate-coreml-model.sh $1
