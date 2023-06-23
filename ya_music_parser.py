import os
from pprint import pprint

from dotenv import load_dotenv
from yandex_music import Client


def wrap_for_sql(input_str: str) -> str:
    tmp = input_str.replace("'", "\\'")
    return f"'{tmp}'"


if __name__ == '__main__':
    load_dotenv()
    token = os.getenv('YANDEX_TOKEN')

    client = Client(token)
    client.init()

    artists = [#72994,   # Dethklok
               #381067,  # Ed Sheeran
              # 36833,   # Red Hot Chili Peppers
              # 68227,   # Led Zeppelin
               7147,    # Kiss
             #  58469,   # Twisted Sister
               ]

    data = []
    for artist in artists:
        albums = client.artists_direct_albums(artist)
        artist_dict = {
            'name': client.artists(artist)[0].name,
            'albums': []
        }
        for album in albums.albums:
            album_dict = {}
            tracks = client.albumsWithTracks(album_id=album.id).volumes[0]
            songs = []
            for song in tracks:
                songs.append({
                    'name': song.title,
                    'duration': int(song.duration_ms / 1000)
                })
            album_dict['album_name'] = album.title
            album_dict['release'] = album.release_date[:10]
            album_dict['songs'] = songs
            artist_dict['albums'].append(album_dict)
        data.append(artist_dict)


    # pprint(data, indent=2)
    #ON CONFLICT DO NOTHING

    artists = [f"    ({wrap_for_sql(art['name'])})" for art in data]
    # pprint(',\n'.join(artists))

    albums = []
    for art in data:
        albums_tmp = []
        for alb in art['albums']:
            albums_tmp.append({'artist': art['name'], 'album': alb['album_name']})
        albums.append(albums_tmp)
    # pprint(albums)

    songs = []
    for art in data:
        for alb in art['albums']:
            songs_tmp = []
            for song in alb['songs']:
                songs_tmp.append({'album': alb['album_name'], **song})
            songs.append(songs_tmp)
    # pprint(songs)

    artis_sql = 'INSERT INTO artist(artist_name) VALUES\n '+ ',\n'.join(artists) + ';\n'
    pprint(artis_sql)


