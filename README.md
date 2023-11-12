# Whisper.cpp Script

Below are my scripts to work with the [whisper.cpp](https://github.com/ggerganov/whisper.cpp) project, a C++ implementation of OpenAI's Whisper model.

These scripts automate the process of extracting audio from videos and generating subtitles using the whisper.cpp, and transcribing real-time audio.

Instructions are tailored for Apple Silicon devices.

## Getting Started

- Clone the whisper.cpp repository and build it with Core ML support according to its instructions
- Download the desired ggml models and convert them to Core ML models following the instructions in whisper.cpp.

## Audio extraction from video

First, ensure that `ffmpeg` is installed for audio extraction.Run `brew install ffmpeg` to install `ffmpeg` with Homebrew.

**extract_audio.sh** script extracts the audio track from a video file in the format that is required for whisper.cpp. Usage:
  - Run the script with two arguments: the input video file and the output audio file.
  - Example: `./extract_audio.sh input_video.mp4 output_audio.wav`

## Generate subtitles from an audio file

**generate_subs.sh** script uses whisper.cpp to generate subtitles from an audio file. Before using it, first make sure set the location of whisper.cpp and the desired model in the script.

Usage:
  - Run the script with two arguments: the input audio file and the output SRT file.
  - Example: `./generate_subs.sh input_audio.wav subtitles.srt`

## Transcribe real-time audio

**stream.sh** script transcribes real-time audio from an audio capturing device.

Before using it, first set the location of whisper.cpp, the desired model and audio capturing device in the script. Also, make sure that you compiled the
`stream` tool in whisper.cpp according to its instructions.

To see the list of audio capture device ids, run the `stream` binary in whisper.cpp, it will list the allowed devices.

Usage:
  - Run the script with two arguments: the input audio file and the output SRT file.
  - Example: `./generate_subs.sh input_audio.wav subtitles.srt`
