import argparse
import os
from tinytag import TinyTag

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        prog="Rename all files in album for convention."
    )
    parser.add_argument("-a", "--album")
    args = parser.parse_args()
    path_to_album = args.album
    files = os.listdir(path_to_album)
    for file in files:
        full_path = os.path.join(path_to_album, file)
        # if it's not supported, it is cover.jpg
        if not TinyTag.is_supported(full_path):
            continue
        tag = TinyTag.get(full_path)
        samplerate = tag.samplerate / 1000
        track_num = tag.track
        title = tag.title
        print(samplerate)
        print(track_num)
        print(title)