import os
from tinytag import TinyTag

'''
Handle features in artist name.

Example:
    Song Title by Artist 1 ({feat./ft./with/etc.} Artist 2) will turn into
    Song Title (feat. Artist 2) by Artist 1
'''
MATCHES = [
    'feat',
    'ft',
    'with'
]

def format_title_and_artist(title:str, artist:str, album_artist:str) -> tuple[str, str]:
    # detect feat/ft/with/etc in artist
    if artist == album_artist:
        return title, artist
    else:
        feature = artist.replace(album_artist, '').strip()

        for match in MATCHES:
            if not (match in feature):
                continue
            else:
                feature = feature.replace(match, '').strip()
                title = f'{title} (feat. {feature})'
                break

        return title, album_artist 

def handle_features(music_dir):
    dirs = os.listdir(music_dir)
    for dir_ in dirs:
        path_to_album = os.path.join(music_dir, dir_)
        files = os.listdir(path_to_album)

        for file in files: 
            full_path = os.path.join(path_to_album, file)
            # if it's not supported, it is cover.jpg
            if not TinyTag.is_supported(full_path):
                continue
            tag = TinyTag.get(full_path)
            # Get necessary info
            # Process title and artist:
            album_artist = tag.albumartist
            title = tag.title
            artist = tag.artist
            title, artist = format_title_and_artist(title, artist, album_artist)
            print('hi')

if __name__ == "__main__":
    handle_features('/home/adam/Music')
