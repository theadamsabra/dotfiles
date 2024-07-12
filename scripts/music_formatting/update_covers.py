from PIL import Image
from mutagen.flac import FLAC, Picture
import argparse
import glob
import os


# Loop through dirs of struct artist/album/file.filetype
def find_image(album_dir: str):
    # Search for image. Assume it is jpg 
    # TODO: figure out why glob aint globbin
    cover_path = glob.glob(os.path.join(album_dir, '*.jpg'))
    print(cover_path)
    assert len(cover_path) == 1, f"Expected one image. Instead got {cover_path}"
    return cover_path[0]

# Load album cover and ensure it is square:
def load_cover(cover_path: str, image_size: tuple[int, int] = (500,500)):
    img = Image.open(cover_path)
    width, height = img.size
    assert width == height, f"Expected square cover. Got cover of shape ({width, height})"
    # Convert to 500,500
    return img.resize(image_size)

# Convert album cover to progressive jpeg
def convert_and_save_to_progressive_jpeg(cover: Image, cover_path: str, album_dir: str):
    final_cover_path = os.path.join(album_dir, 'cover.jpeg')
    cover.save(final_cover_path, format='JPEG', quality=85, optimize=True, progressive=True)
    # Don't want the original if it's not the same name:
    if cover_path != final_cover_path:
        os.remove(cover_path)

# (Bonus): Embed image to all audio files in album
def embed_to_all_files(album_dir: str, cover_path: str): 
    # I only use flac cause I'm not a pleb. get gud kid
    songs = glob.glob(os.path.join(album_dir, '*flac'))
    for song in songs:
        flac = FLAC(song)
        image = Picture()
        image.type = 3
        with open(cover_path, 'rb') as f:
            image.data = f.read()
        flac.add_picture(image)
        flac.save()



if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('-a', '--album_dir')
    args = parser.parse_args()
    album_dir = args.album_dir
    
    cover_path = find_image(album_dir)
    cover = load_cover(cover_path)
    convert_and_save_to_progressive_jpeg(cover, cover_path, album_dir)
    embed_to_all_files(album_dir, cover_path)
