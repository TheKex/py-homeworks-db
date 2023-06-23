import os
from pprint import pprint

from dotenv import load_dotenv
from yandex_music import Client


def wrap_for_sql(input_str: str) -> str:
    tmp = input_str.replace("'", "''")
    return f"'{tmp}'"


if __name__ == '__main__':
    load_dotenv()
    token = os.getenv('YANDEX_TOKEN')

    client = Client(token)
    client.init()

    artists = [#72994,   # Dethklok
               381067,  # Ed Sheeran
               36833,   # Red Hot Chili Peppers
               68227,   # Led Zeppelin
         #      7147,    # Kiss
               58469,   # Twisted Sister
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
            albums_tmp.append({'artist': art['name'], 'album': alb['album_name'], 'release': alb['release']})
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

    artis_sql = 'INSERT INTO artist(artist_name) VALUES\n ' + ',\n'.join(artists) + ';\n'
    # print(artis_sql)

    total_albums = []
    for alb1 in albums:
        for alb in alb1:
            total_albums.append('    (to_date(\'' + alb['release'] + '\', \'yyyy-mm-dd\'), ' + wrap_for_sql(alb['album']) + ')')
    albums_sql = 'INSERT INTO album(release_date, album_name) VALUES\n' + ',\n'.join(total_albums) + ';'

    artist_albums = []
    for alb in albums:
        artist_albums.append([f"'{alb[0]['artist']}'", '(' + ', '.join([f"{wrap_for_sql(alb1['album'])}" for alb1 in alb]) + ')'])

    artist_albums_sql = []
    for sql in artist_albums:
        artist_albums_sql.append(
            'INSERT INTO album_artist(album, artist)' +
        '''
            SELECT al.id album,
                   ar.id artist
              FROM album al
                   CROSS JOIN artist ar 
             WHERE al.album_name IN ''' + sql[1] + '''
               AND ar.artist_name = ''' + sql[0] + ''';       
        '''
        )
    # for sql in artist_albums_sql:
    #     print(sql)

    songs_total_sql = []
    for song in songs:
        songs_total_sql.append(
            '''
INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (\n''' +
'UNION ALL\n'.join(['            SELECT ' + wrap_for_sql(s['name']) + ' name,  ' + str(s['duration']) + ' duration ' for s in song])
+ ''') b
     WHERE a.album_name = ''' + wrap_for_sql(song[0]['album']) + ''';         
            '''
        )

    print(albums_sql)
    print('\n'.join(artist_albums_sql))
    print('\n'.join(songs_total_sql))







