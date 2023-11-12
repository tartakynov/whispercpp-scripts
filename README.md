# whisper.cpp scripts

These are scripts to work with the [whisper.cpp](https://github.com/ggerganov/whisper.cpp) project, which is a C++ implementation of OpenAI's Whisper model.

The purpose of these scripts is to simplify the process of extracting audio from videos in the format required by whisper.cpp, generating subtitles, and transcribing real-time audio using whisper.cpp. These instructions are specifically designed for Apple Silicon devices.

## Getting Started

1. Clone the whisper.cpp repository and build it with Core ML support by following its provided instructions.
2. Download the necessary ggml models and convert them to Core ML models as directed in the whisper.cpp documentation.

## Audio Extraction from Video

Ensure `ffmpeg` is installed for audio extraction. Use Homebrew to install it by running `brew install ffmpeg`.

### Using `extract_audio.sh`
This script extracts the audio track from a video file in a format compatible with whisper.cpp.

**Usage:**
- Execute the script with two arguments: the input video file and the output audio file.
- For example: `./extract_audio.sh input_video.mp4 output_audio.wav`

## Generating Subtitles from an Audio File

### Using `generate_subs.sh`
This script uses whisper.cpp to create subtitles from an audio file. Before usage, configure the script with the location of your whisper.cpp installation and the desired model.

**Usage:**
- Run the script with two arguments: the input audio file and the output SRT file.
- For example: `./generate_subs.sh input_audio.wav subtitles.srt`

## Transcribing Real-Time Audio

### Using `stream.sh`
The `stream.sh` runs whisper.cpp to transcribe audio in real-time from an audio capture device.

Before usage, update the script with the location of your whisper.cpp installation, the chosen model, and the audio capturing device. Also, ensure that you have compiled the `stream` tool in whisper.cpp following its instructions.

To find the list of available audio capture device IDs, execute the `stream` binary within whisper.cpp; it will display the supported devices.

**Usage:**
- Just run the script, for example: `./stream.sh`
