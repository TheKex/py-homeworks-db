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
 
  
  
       


















SELECT count(s.ID),
       (SELECT g1.genre_name
          FROM genre g1
         WHERE g1.ID = g.ID) 
  FROM genre g
       JOIN artist_genre ag ON ag.genre = g.id 
       JOIN artist a ON a.id = ag.artist 
       JOIN album_artist aa ON aa.artist = a.id 
       JOIN album a2 ON a2.id = aa.album 
       JOIN song s ON s.song_album = a2.id 
 GROUP BY (g.id)