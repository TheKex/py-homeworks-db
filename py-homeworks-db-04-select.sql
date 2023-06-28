-- Задание 2
----- 2.1 Название и продолжительность самого длительного трека.
 SELECT s.song_name,
        s.song_duration_seconds
   FROM song s 
  ORDER BY s.song_duration_seconds DESC 
  LIMIT 1;

----- 2.2 Название треков, продолжительность которых не менее 3,5 минут
 SELECT s.song_name
   FROM song s 
  WHERE s.song_duration_seconds >= 210;
  
----- 2.3 Названия сборников, вышедших в период с 2018 по 2020 год включительно.
 SELECT c.collection_name 
   FROM collection c 
  WHERE EXTRACT('year' FROM c.release_date) BETWEEN '2018' AND '2020';
   
----- 2.4 Исполнители, чьё имя состоит из одного слова.
 SELECT a.artist_name 
   FROM artist a 
  WHERE a.artist_name NOT LIKE '% %';

----- 2.5 Название треков, которые содержат слово «мой» или «my».
 SELECT s.song_name
   FROM song s 
  WHERE lower(s.song_name) LIKE '%my%'
     OR lower(s.song_name) LIKE '%мой%';

-- Задание 3
------ 3.1 Количество исполнителей в каждом жанре.
 SELECT g.genre_name,
        count(ag.artist)
   FROM genre g 
        LEFT JOIN artist_genre ag ON ag.genre = g.id
  GROUP BY g.genre_name;
  
----- 3.2 Количество треков, вошедших в альбомы 2019–2020 годов.
 SELECT count(s.ID)
   FROM album a
        JOIN song s ON s.song_album = a.id
  WHERE EXTRACT('year' FROM a.release_date) BETWEEN '2019' AND '2020'; 
  
----- 3.3 Средняя продолжительность треков по каждому альбому.
 SELECT a.album_name, 
        avg(s.song_duration_seconds) avg_duration
   FROM album a
        JOIN song s ON s.song_album = a.id
  GROUP BY a.album_name; 
  
----- 3.4 Все исполнители, которые не выпустили альбомы в 2020 году.
 SELECT a.artist_name
   FROM artist a 
  WHERE a.id NOT IN (SELECT aa.artist
                       FROM album_artist aa
                            JOIN album a2 ON a2.id = aa.album
                      WHERE EXTRACT('year' FROM a2.release_date) = '2020');
                  
----- 3.5 Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
 SELECT DISTINCT c.collection_name
   FROM collection c 
        JOIN song_collection sc ON sc.collection = c.id 
        JOIN song s ON s.id = sc.song 
        JOIN album_artist aa ON aa.album = s.song_album
        JOIN artist a ON a.id = aa.artist
  WHERE a.artist_name = 'Twisted Sister';
  
-- Задание 4
----- 4.1 Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT a.album_name
  FROM album a
       JOIN album_artist aa ON aa.album = a.id
 WHERE aa.artist IN (SELECT ag.artist
                       FROM artist_genre ag
                      GROUP BY ag.artist
                     HAVING count(ag.genre) > 1);

----- 4.2 Наименования треков, которые не входят в сборники.
SELECT s.song_name
  FROM song s
 WHERE NOT EXISTS (SELECT NULL
                     FROM song_collection sc
                    WHERE sc.song = s.id);

----- 4.3 Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
 SELECT a.artist_name
   FROM song s2
        JOIN album_artist aa ON aa.album = s2.song_album
        JOIN artist a ON a.id = aa.artist
  WHERE s2.song_duration_seconds = (SELECT min(s.song_duration_seconds)
                                      FROM song s);

----- 4.4 Названия альбомов, содержащих наименьшее количество треков.
WITH minimum AS (SELECT count(s.ID) song_count,
                        s.song_album
                   FROM song s
                  GROUP BY s.song_album)
SELECT a.album_name
  FROM album a
 WHERE EXISTS (SELECT null
                 FROM minimum s
                WHERE s.song_album = a.id
                  AND s.song_count = (SELECT min(song_count) FROM minimum));