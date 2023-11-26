# this script removes whisper's hallucinations from an srt file
# whisper tends to hallucinate sometimes repeating the same string multiple times
# particularly when encountering periods of silence in the audio
# so this script just removes those duplications from the srt file

import sys

LOOKBACK_COUNT = 3

def main():
    if len(sys.argv) != 2:
        print(f"Usage: python {sys.argv[0]} <srt_path>")

    in_path = sys.argv[1]

    prev_texts = []

    with open(in_path, 'r', encoding='utf-8') as file:
        current_position = 0
        while True:
            if file.readline(): # read position counter
                timestamp = file.readline().strip() # read timestamp
                text = ""
                while True:
                    line = file.readline().strip()
                    if len(line) > 0:
                        text += line + "\n"
                    else:
                        break

                if text not in prev_texts:
                    current_position += 1
                    print(current_position)
                    print(timestamp)
                    print(text)

                prev_texts.append(text)
                if len(prev_texts) > LOOKBACK_COUNT:
                    prev_texts.pop(0)
            else:
                break


if __name__ == "__main__":
    main()
