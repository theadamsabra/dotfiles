from absl.testing import absltest
from handle_features import format_title_and_artist

class FormatTest(absltest.TestCase):

    def test_no_features(self):
        title = 'Eye (Instrumental)'
        artist = 'Madvillain'
        album_artist = 'Madvillain'
        
        title_out, artist_out = format_title_and_artist(title, artist, album_artist)
        assert title_out == title
        assert artist_out == artist
        assert artist_out == album_artist
    
    def test_no_features_no_album_artist(self):
        title = 'Is It a Crime?'
        artist = 'Sade'
        album_artist = 'None'