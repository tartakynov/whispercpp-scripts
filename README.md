# whisper.cpp scripts

In this repo I openly store my scripts I use with [whisper.cpp](https://github.com/ggerganov/whisper.cpp), which is a C++ implementation of OpenAI's Whisper model. The idea is to have a handy, easy-to-follow reference for those times when I need to circle back to using whisper.cpp after a while.

## Getting Started

You can skip the Core ML part for non-Apple Silicon devices.

1. Run the following to clone [whisper.cpp](https://github.com/ggerganov/whisper.cpp) repository
   ```
   git submodule init
   git submodule update
   ```
2. Build it with Core ML support by following its provided instructions.
3. Download the necessary ggml models with the download script `./download.sh <model>`

## Build whisper.cpp models from HuggingFace

1. Set model name and path
   ```
   MODEL_NAME=small.ru
   MODEL_PATH=erlandekh/whisper-small-russian
   ```
2. Patch `models/convert-h5-to-coreml.py` to allow your model name
3. Go to whisper.cpp folder and activate VirtualEnv
   ```
   cd whisper.cpp
   source venv/bin/activate
   ```
4. Download and convert the HuggingFace model to CoreML
   ```
   models/generate-coreml-model.sh -h5 ${MODEL_NAME} ${MODEL_PATH}
   ```
5. Convert the downloaded model to ggml
   ```
   python models/convert-pt-to-ggml.py models/hf-${MODEL_NAME}.pt ../whisper/ models/
   mv models/ggml-model.bin models/ggml-${MODEL_NAME}.bin
   ```

## Audio extraction

**`extract_audio.sh`**

This script extracts the audio track from a video file in a format compatible with whisper.cpp. Ensure `ffmpeg` is installed for audio extraction. Use Homebrew to install it by running `brew install ffmpeg`.

Usage:
- Execute the script with two arguments: the input video file and the output audio file.
- For example: `./extract_audio.sh input_video.mp4 output_audio.wav`

## Generating subtitles

**`generate_subs.sh`**

This script uses whisper.cpp to create subtitles from an audio file. Before usage, configure the script with the location of your whisper.cpp installation and the desired model.

Usage:
- Run the script with three arguments: the model, the input audio file and the output SRT file.
- For example: `./generate_subs.sh small.en input_audio.wav subtitles.srt`

## Real-time transcribing

**`stream.sh`**

This script relies on whisper.cpp's `stream` binary to transcribe audio in real-time from an audio capture device.

If you're on Apple Silicon device, you can compile whisper.cpp's `stream` with Core ML support for better performance. Run the following in your whisper.cpp folder
```sh
WHISPER_COREML=1 make stream -j
```

Before usage, update the script with the location of your whisper.cpp installation, the chosen model, and the audio capturing device. Also, ensure that you have compiled the `stream` tool in whisper.cpp.

To find the list of available audio capture device IDs, execute the `stream` binary within whisper.cpp; it will display the supported devices.

Usage:
- Run the script with one arguments: the model.
- For example: `./stream.sh small.en`

#### Transcribing audio from system output

You can also transcribe live audio straight from your system's output using [BlackHole](https://github.com/ExistentialAudio/BlackHole) audio loopback driver.

This is how it works
![Visual Guide](https://github.com/tartakynov/whispercpp-scripts/assets/946309/6cc1f3a4-26c9-4d50-a19c-c2f88ef633c6)

What you need to do:
1. Open the Audio MIDI Setup utility on your MacOS and create a Multi-Output Device. Make sure to include your preferred speakers and BlackHole as your output devices.
2. Then, select this new Multi-Output Device as your sound output.
3. Finally, specify BlackHole as the audio capture device for whisper.cpp.

A quick demo showing transcribing real-time audio from your browser. Don't forget to turn up the volume! 🔊

[demo.webm](https://github.com/tartakynov/whispercpp-scripts/assets/946309/f821354e-2e1f-45c8-947f-025e2a4b244d)
