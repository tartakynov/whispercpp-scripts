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
source venv/bin/activate
pip3 install -U ane_transformers openai-whisper coremltools
pip3 install "numpy<2"
pip3 install torch==2.1.0

./models/generate-coreml-model.sh $1
