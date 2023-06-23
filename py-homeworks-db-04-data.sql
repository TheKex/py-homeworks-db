INSERT INTO genre (genre_name) VALUES
            ('иностранный рок'),
            ('хард-рок'),
            ('хэви-метал'),
            ('дэт-метал'),
            ('поп');

INSERT INTO artist(artist_name) VALUES
            ('Ed Sheeran'),
            ('Dethklok'),
            ('Twisted Sister'),
            ('Kiss'),
            ('Led Zeppelin'),
            ('Red Hot Chili Peppers');

INSERT INTO artist_genre (genre, artist)
SELECT g.ID genre_id,
       a.ID artist_id
  FROM genre g
       CROSS JOIN artist a
 WHERE g.genre_name = 'иностранный рок'
   AND a.artist_name IN ('Twisted Sister', 'Kiss', 'Led Zeppelin', 'Red Hot Chili Peppers');

INSERT INTO artist_genre (genre, artist)
SELECT g.ID genre_id,
       a.ID artist_id
  FROM genre g
       CROSS JOIN artist a
 WHERE g.genre_name = 'хард-рок'
   AND a.artist_name IN ('Twisted Sister', 'Kiss', 'Led Zeppelin');

INSERT INTO artist_genre (genre, artist)
SELECT g.ID genre_id,
       a.ID artist_id
  FROM genre g
       CROSS JOIN artist a
 WHERE g.genre_name = 'хэви-метал'
   AND a.artist_name IN ('Twisted Sister', 'Kiss');

INSERT INTO artist_genre (genre, artist)
SELECT g.ID genre_id,
       a.ID artist_id
  FROM genre g
       CROSS JOIN artist a
 WHERE g.genre_name = 'дэт-метал'
   AND a.artist_name IN ('Dethklok');

INSERT INTO artist_genre (genre, artist)
SELECT g.ID genre_id,
       a.ID artist_id
  FROM genre g
       CROSS JOIN artist a
 WHERE g.genre_name = 'поп'
   AND a.artist_name IN ('Ed Sheeran');


INSERT INTO album(release_date, album_name) VALUES
    (to_date('2013-10-28', 'yyyy-mm-dd'), 'The Doomstar Requiem: A Klok Opera Soundtrack'),
    (to_date('2012-10-16', 'yyyy-mm-dd'), 'Dethalbum III'),
    (to_date('2009-09-28', 'yyyy-mm-dd'), 'Dethalbum II'),
    (to_date('2007-06-25', 'yyyy-mm-dd'), 'The Dethalbum'),
    (to_date('2022-03-11', 'yyyy-mm-dd'), 'KISS Off The Soundboard: Live In Virginia Beach'),
    (to_date('2021-11-19', 'yyyy-mm-dd'), 'Destroyer'),
    (to_date('2021-11-19', 'yyyy-mm-dd'), 'Rock N'' Rolls Royce / Detroit Rock City / Beth'),
    (to_date('2021-06-11', 'yyyy-mm-dd'), 'KISS Off The Soundboard: Tokyo 2001'),
    (to_date('2019-08-08', 'yyyy-mm-dd'), 'Detroit Rock City'),
    (to_date('2019-08-08', 'yyyy-mm-dd'), 'Black Diamond'),
    (to_date('2019-06-25', 'yyyy-mm-dd'), 'Kiss Early FM Radio Broadcast vol. 4'),
    (to_date('2019-06-25', 'yyyy-mm-dd'), 'Kiss Early FM Radio Broadcast vol. 3'),
    (to_date('2019-06-25', 'yyyy-mm-dd'), 'Kiss Early FM Radio Broadcast vol. 2'),
    (to_date('2019-06-25', 'yyyy-mm-dd'), 'Kiss Early FM Radio Broadcast vol. 1'),
    (to_date('2019-04-17', 'yyyy-mm-dd'), 'Nothin'' To Lose'),
    (to_date('2017-06-09', 'yyyy-mm-dd'), 'KISSWORLD - The Best Of KISS'),
    (to_date('2015-05-11', 'yyyy-mm-dd'), 'Live At Lafayette Music Room, Memphis, April 18, 1974'),
    (to_date('2014-01-01', 'yyyy-mm-dd'), 'Killers'),
    (to_date('2014-01-01', 'yyyy-mm-dd'), 'KISS 40'),
    (to_date('2012-01-01', 'yyyy-mm-dd'), 'Monster'),
    (to_date('2012-01-01', 'yyyy-mm-dd'), 'Destroyer (Resurrected)'),
    (to_date('2008-01-01', 'yyyy-mm-dd'), 'Ikons'),
    (to_date('2006-11-21', 'yyyy-mm-dd'), 'Alive! 1975-2000'),
    (to_date('2006-01-01', 'yyyy-mm-dd'), 'Alive: The Millennium Concert');

INSERT INTO album_artist(album, artist)
            SELECT al.id album,
                   ar.id artist
              FROM album al
                   CROSS JOIN artist ar
             WHERE al.album_name IN ('The Doomstar Requiem: A Klok Opera Soundtrack', 'Dethalbum III', 'Dethalbum II', 'The Dethalbum')
               AND ar.artist_name = 'Dethklok';

INSERT INTO album_artist(album, artist)
            SELECT al.id album,
                   ar.id artist
              FROM album al
                   CROSS JOIN artist ar
             WHERE al.album_name IN ('KISS Off The Soundboard: Live In Virginia Beach', 'Destroyer', 'Rock N'' Rolls Royce / Detroit Rock City / Beth', 'KISS Off The Soundboard: Tokyo 2001', 'Detroit Rock City', 'Black Diamond', 'Kiss Early FM Radio Broadcast vol. 4', 'Kiss Early FM Radio Broadcast vol. 3', 'Kiss Early FM Radio Broadcast vol. 2', 'Kiss Early FM Radio Broadcast vol. 1', 'Nothin'' To Lose', 'KISSWORLD - The Best Of KISS', 'Live At Lafayette Music Room, Memphis, April 18, 1974', 'Killers', 'KISS 40', 'Monster', 'Destroyer (Resurrected)', 'Ikons', 'Alive! 1975-2000', 'Alive: The Millennium Concert')
               AND ar.artist_name = 'Kiss';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'The Birth/Fata Sidus Oritur/One of Us Must Die' name,  201 duration UNION ALL
            SELECT 'Magnus and the Assassin' name,  141 duration UNION ALL
            SELECT 'Partying Around the World' name,  146 duration UNION ALL
            SELECT 'Tracking/Ishnifus and the Challenge' name,  218 duration UNION ALL
            SELECT 'How Can I Be a Hero?' name,  148 duration UNION ALL
            SELECT 'The Fans Are Chatting' name,  144 duration UNION ALL
            SELECT 'Abigail''s Lullaby' name,  101 duration UNION ALL
            SELECT 'Some Time Ago. . .' name,  221 duration UNION ALL
            SELECT 'The Duel' name,  155 duration UNION ALL
            SELECT 'I Believe' name,  146 duration UNION ALL
            SELECT 'A Traitor Amongst Them' name,  40 duration UNION ALL
            SELECT 'Training/Do It All for My Brother' name,  214 duration UNION ALL
            SELECT 'Before You Go' name,  85 duration UNION ALL
            SELECT 'The Answer Is in Your Past' name,  77 duration UNION ALL
            SELECT 'The Depths of Humanity' name,  162 duration UNION ALL
            SELECT 'Givin'' Back to You' name,  164 duration UNION ALL
            SELECT 'En Antris Et Stella Fatum Cruenti' name,  166 duration UNION ALL
            SELECT 'The Crossroads' name,  48 duration UNION ALL
            SELECT 'Morte Lumina' name,  247 duration UNION ALL
            SELECT 'Blazing Star' name,  276 duration UNION ALL
            SELECT 'Doomstar Orchestra' name,  1402 duration ) b
     WHERE a.album_name = 'The Doomstar Requiem: A Klok Opera Soundtrack';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'I Ejaculate Fire' name,  218 duration UNION ALL
            SELECT 'Crush The Industry' name,  329 duration UNION ALL
            SELECT 'Andromeda' name,  207 duration UNION ALL
            SELECT 'The Galaxy' name,  315 duration UNION ALL
            SELECT 'Starved' name,  297 duration UNION ALL
            SELECT 'Killstardo Abominate' name,  151 duration UNION ALL
            SELECT 'Ghostqueen' name,  258 duration UNION ALL
            SELECT 'Impeach God' name,  214 duration UNION ALL
            SELECT 'Biological Warfare' name,  275 duration UNION ALL
            SELECT 'Skyhunter' name,  248 duration UNION ALL
            SELECT 'The Hammer' name,  268 duration UNION ALL
            SELECT 'Rejoin' name,  292 duration ) b
     WHERE a.album_name = 'Dethalbum III';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Bloodlines' name,  210 duration UNION ALL
            SELECT 'The Gears' name,  261 duration UNION ALL
            SELECT 'Burn the Earth' name,  239 duration UNION ALL
            SELECT 'Laser Cannon Deth Sentence' name,  275 duration UNION ALL
            SELECT 'Black Fire Upon Us' name,  340 duration UNION ALL
            SELECT 'Dethsupport' name,  162 duration UNION ALL
            SELECT 'The Cyborg Slayers' name,  256 duration UNION ALL
            SELECT 'I Tamper With The Evidence At The Murder Site of Odin' name,  270 duration UNION ALL
            SELECT 'Murmaider II: The Water God' name,  343 duration UNION ALL
            SELECT 'Comet Song' name,  228 duration UNION ALL
            SELECT 'Symmetry' name,  271 duration UNION ALL
            SELECT 'Volcano' name,  258 duration ) b
     WHERE a.album_name = 'Dethalbum II';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Murmaider' name,  204 duration UNION ALL
            SELECT 'Go Into the Water' name,  260 duration UNION ALL
            SELECT 'Awaken' name,  217 duration UNION ALL
            SELECT 'Bloodrocuted' name,  138 duration UNION ALL
            SELECT 'Go Forth and Die' name,  261 duration UNION ALL
            SELECT 'Fansong' name,  172 duration UNION ALL
            SELECT 'Better Metal Snake' name,  206 duration UNION ALL
            SELECT 'The Lost Vikings' name,  266 duration UNION ALL
            SELECT 'Thunderhorse' name,  165 duration UNION ALL
            SELECT 'Briefcase Full of Guts' name,  163 duration UNION ALL
            SELECT 'Birthday Dethday' name,  168 duration UNION ALL
            SELECT 'Hatredcopter' name,  176 duration UNION ALL
            SELECT 'Castratikron' name,  177 duration UNION ALL
            SELECT 'Face Fisted' name,  257 duration UNION ALL
            SELECT 'Detharmonic' name,  270 duration ) b
     WHERE a.album_name = 'The Dethalbum';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Love Gun' name,  295 duration UNION ALL
            SELECT 'Deuce' name,  237 duration UNION ALL
            SELECT 'Makin'' Love' name,  242 duration UNION ALL
            SELECT 'Lick It Up' name,  357 duration UNION ALL
            SELECT 'Christine Sixteen' name,  202 duration UNION ALL
            SELECT 'Tears Are Falling' name,  244 duration UNION ALL
            SELECT 'She' name,  463 duration UNION ALL
            SELECT 'Got To Choose' name,  246 duration UNION ALL
            SELECT 'I Love It Loud' name,  253 duration UNION ALL
            SELECT 'I Want You' name,  477 duration ) b
     WHERE a.album_name = 'KISS Off The Soundboard: Live In Virginia Beach';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Detroit Rock City' name,  315 duration UNION ALL
            SELECT 'King Of The Night Time World' name,  200 duration UNION ALL
            SELECT 'God Of Thunder' name,  256 duration UNION ALL
            SELECT 'Great Expectations' name,  264 duration UNION ALL
            SELECT 'Flaming Youth' name,  180 duration UNION ALL
            SELECT 'Sweet Pain' name,  200 duration UNION ALL
            SELECT 'Shout It Out Loud' name,  169 duration UNION ALL
            SELECT 'Beth' name,  165 duration UNION ALL
            SELECT 'Do You Love Me' name,  219 duration UNION ALL
            SELECT 'Rock ''N'' Roll Party' name,  84 duration ) b
     WHERE a.album_name = 'Destroyer';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Rock N'' Rolls Royce' name,  182 duration UNION ALL
            SELECT 'Detroit Rock City' name,  140 duration UNION ALL
            SELECT 'Beth' name,  168 duration ) b
     WHERE a.album_name = 'Rock N'' Rolls Royce / Detroit Rock City / Beth';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Detroit Rock City' name,  298 duration UNION ALL
            SELECT 'Deuce' name,  326 duration UNION ALL
            SELECT 'Shout It Out Loud' name,  236 duration UNION ALL
            SELECT 'Talk To Me' name,  265 duration UNION ALL
            SELECT 'I Love It Loud' name,  242 duration UNION ALL
            SELECT 'Firehouse' name,  344 duration UNION ALL
            SELECT 'Do You Love Me' name,  298 duration UNION ALL
            SELECT 'Calling Dr. Love' name,  249 duration UNION ALL
            SELECT 'Heaven''s On Fire' name,  277 duration UNION ALL
            SELECT 'Let Me Go Rock & Roll' name,  405 duration UNION ALL
            SELECT 'Shock Me / Guitar Solo' name,  796 duration UNION ALL
            SELECT 'Psycho Circus' name,  351 duration UNION ALL
            SELECT 'Lick It Up' name,  352 duration UNION ALL
            SELECT 'God Of Thunder / Drum Solo' name,  579 duration UNION ALL
            SELECT 'Cold Gin' name,  407 duration UNION ALL
            SELECT '100,000 Years' name,  620 duration UNION ALL
            SELECT 'Love Gun' name,  299 duration UNION ALL
            SELECT 'I Still Love You' name,  253 duration UNION ALL
            SELECT 'Black Diamond' name,  415 duration UNION ALL
            SELECT 'I Was Made For Lovin'' You' name,  364 duration UNION ALL
            SELECT 'Rock & Roll All Nite' name,  408 duration ) b
     WHERE a.album_name = 'KISS Off The Soundboard: Tokyo 2001';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Deuce' name,  204 duration UNION ALL
            SELECT 'Love Gun' name,  254 duration UNION ALL
            SELECT 'Firehouse' name,  197 duration UNION ALL
            SELECT 'Cold Gin' name,  314 duration UNION ALL
            SELECT 'Black Diamond' name,  268 duration UNION ALL
            SELECT 'No No No' name,  339 duration UNION ALL
            SELECT 'Crazy Crazy Nights' name,  241 duration UNION ALL
            SELECT 'Calling Dr. Love' name,  221 duration UNION ALL
            SELECT 'Lick It Up' name,  243 duration UNION ALL
            SELECT 'Fits Like A Glove' name,  302 duration UNION ALL
            SELECT 'Tears Are Falling' name,  229 duration UNION ALL
            SELECT 'Heaven''s On Fire' name,  245 duration UNION ALL
            SELECT 'Strutter' name,  231 duration UNION ALL
            SELECT 'Shout It Out Loud' name,  282 duration UNION ALL
            SELECT 'I Love It Loud' name,  239 duration UNION ALL
            SELECT 'War Machine' name,  289 duration UNION ALL
            SELECT 'Rock And Roll All Nite' name,  296 duration UNION ALL
            SELECT 'Detroit Rock City' name,  302 duration ) b
     WHERE a.album_name = 'Detroit Rock City';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Deuce' name,  205 duration UNION ALL
            SELECT 'Love Gun' name,  256 duration UNION ALL
            SELECT 'Black Diamond' name,  270 duration UNION ALL
            SELECT 'Calling Dr. Love' name,  223 duration UNION ALL
            SELECT 'No No No' name,  341 duration UNION ALL
            SELECT 'Firehouse' name,  199 duration UNION ALL
            SELECT 'Cold Gin' name,  316 duration UNION ALL
            SELECT 'Crazy Crazy Nights' name,  243 duration UNION ALL
            SELECT 'Heaven''s On Fire' name,  246 duration UNION ALL
            SELECT 'War Machine' name,  291 duration UNION ALL
            SELECT 'Tears Are Falling' name,  231 duration UNION ALL
            SELECT 'Fits Like A Glove' name,  304 duration UNION ALL
            SELECT 'I Love It Loud' name,  241 duration UNION ALL
            SELECT 'Strutter' name,  231 duration ) b
     WHERE a.album_name = 'Black Diamond';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Rock And Roll All Nite' name,  364 duration UNION ALL
            SELECT 'She' name,  353 duration UNION ALL
            SELECT 'Strutter' name,  260 duration UNION ALL
            SELECT 'Detroit Rock City' name,  323 duration UNION ALL
            SELECT 'Soy Kissero' name,  192 duration UNION ALL
            SELECT 'Creatures Of The Night' name,  265 duration UNION ALL
            SELECT 'Forever' name,  244 duration UNION ALL
            SELECT 'Heaven''s On Fire' name,  261 duration UNION ALL
            SELECT 'I Love It Loud' name,  250 duration UNION ALL
            SELECT 'Lick It Up' name,  372 duration UNION ALL
            SELECT 'La Bamba' name,  82 duration UNION ALL
            SELECT 'Black Diamond' name,  444 duration ) b
     WHERE a.album_name = 'Kiss Early FM Radio Broadcast vol. 4';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Firehouse' name,  268 duration UNION ALL
            SELECT '100,000 Years' name,  325 duration UNION ALL
            SELECT 'Calling Dr. Love' name,  188 duration UNION ALL
            SELECT 'Tears Are Falling' name,  244 duration UNION ALL
            SELECT 'Domino' name,  240 duration UNION ALL
            SELECT 'I Was Made For Lovin'' You' name,  278 duration UNION ALL
            SELECT 'Makin'' Love' name,  215 duration UNION ALL
            SELECT 'Unholy' name,  222 duration UNION ALL
            SELECT 'Watchin'' You' name,  221 duration UNION ALL
            SELECT 'Cold Gin' name,  346 duration UNION ALL
            SELECT 'Parasite' name,  316 duration UNION ALL
            SELECT 'War Machine' name,  254 duration UNION ALL
            SELECT 'I Want You' name,  410 duration UNION ALL
            SELECT 'Deuce' name,  242 duration UNION ALL
            SELECT 'Love Gun' name,  268 duration ) b
     WHERE a.album_name = 'Kiss Early FM Radio Broadcast vol. 3';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Lick It Up' name,  230 duration UNION ALL
            SELECT 'Shout It Out Loud' name,  322 duration UNION ALL
            SELECT 'Strutter' name,  193 duration UNION ALL
            SELECT 'I Love It Loud' name,  213 duration UNION ALL
            SELECT 'Tears Are Falling' name,  234 duration UNION ALL
            SELECT 'Reason To Live' name,  268 duration UNION ALL
            SELECT 'Deuce' name,  234 duration UNION ALL
            SELECT 'I Was Made For Lovin'' You' name,  271 duration UNION ALL
            SELECT 'Crazy Crazy Nights' name,  297 duration UNION ALL
            SELECT 'Firehouse' name,  221 duration UNION ALL
            SELECT 'No No No' name,  320 duration UNION ALL
            SELECT 'Bang Bang You' name,  288 duration UNION ALL
            SELECT 'Black Diamond' name,  204 duration UNION ALL
            SELECT 'Cold Gin' name,  368 duration UNION ALL
            SELECT 'Heaven''s On Fire' name,  259 duration UNION ALL
            SELECT 'Fits Like A Glove' name,  320 duration UNION ALL
            SELECT 'Love Gun' name,  277 duration ) b
     WHERE a.album_name = 'Kiss Early FM Radio Broadcast vol. 2';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'God Of Thunder' name,  1017 duration UNION ALL
            SELECT 'Love Gun' name,  254 duration UNION ALL
            SELECT 'New York Groove' name,  241 duration UNION ALL
            SELECT 'I Was Made For Lovin'' You' name,  284 duration UNION ALL
            SELECT '2,000 Man' name,  620 duration UNION ALL
            SELECT 'Is That You?' name,  230 duration UNION ALL
            SELECT 'Talk To Me' name,  237 duration UNION ALL
            SELECT 'Firehouse' name,  279 duration UNION ALL
            SELECT 'Calling Dr. Love' name,  188 duration UNION ALL
            SELECT 'Shandi' name,  243 duration UNION ALL
            SELECT 'Strutter' name,  194 duration UNION ALL
            SELECT 'Cold Gin' name,  214 duration UNION ALL
            SELECT 'Detroit Rock City' name,  322 duration ) b
     WHERE a.album_name = 'Kiss Early FM Radio Broadcast vol. 1';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Deuce' name,  250 duration UNION ALL
            SELECT 'Black Diamond' name,  331 duration UNION ALL
            SELECT 'Strutter' name,  219 duration UNION ALL
            SELECT '100,000 Years' name,  278 duration UNION ALL
            SELECT 'Nothin'' To Lose' name,  250 duration UNION ALL
            SELECT 'Firehouse' name,  230 duration UNION ALL
            SELECT 'Cold Gin' name,  348 duration UNION ALL
            SELECT 'She' name,  403 duration UNION ALL
            SELECT 'Acrobat' name,  292 duration ) b
     WHERE a.album_name = 'Nothin'' To Lose';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Crazy Crazy Nights' name,  224 duration UNION ALL
            SELECT 'Rock And Roll All Nite' name,  175 duration UNION ALL
            SELECT 'I Was Made For Lovin'' You' name,  239 duration UNION ALL
            SELECT 'God Gave Rock ''N'' Roll To You II' name,  318 duration UNION ALL
            SELECT 'Detroit Rock City' name,  315 duration UNION ALL
            SELECT 'Beth' name,  165 duration UNION ALL
            SELECT 'Lick It Up' name,  236 duration UNION ALL
            SELECT 'Heaven''s On Fire' name,  200 duration UNION ALL
            SELECT 'Tears Are Falling' name,  235 duration UNION ALL
            SELECT 'Unholy' name,  222 duration UNION ALL
            SELECT 'Hard Luck Woman' name,  211 duration UNION ALL
            SELECT 'Psycho Circus' name,  290 duration UNION ALL
            SELECT 'Shout It Out Loud' name,  169 duration UNION ALL
            SELECT 'Calling Dr. Love' name,  223 duration UNION ALL
            SELECT 'Christine Sixteen' name,  192 duration UNION ALL
            SELECT 'Love Gun' name,  195 duration UNION ALL
            SELECT 'Shandi' name,  216 duration UNION ALL
            SELECT 'I''m A Legend Tonight' name,  239 duration UNION ALL
            SELECT 'Modern Day Delilah' name,  215 duration UNION ALL
            SELECT 'Hell Or Hallelujah' name,  247 duration ) b
     WHERE a.album_name = 'KISSWORLD - The Best Of KISS';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Deuce' name,  249 duration UNION ALL
            SELECT 'Strutter' name,  219 duration UNION ALL
            SELECT 'Firehouse' name,  229 duration UNION ALL
            SELECT 'She' name,  403 duration UNION ALL
            SELECT 'Nothin'' To Lose' name,  250 duration UNION ALL
            SELECT 'Cold Gin' name,  348 duration UNION ALL
            SELECT '100,000 Years' name,  278 duration UNION ALL
            SELECT 'Black Diamond' name,  331 duration UNION ALL
            SELECT 'Acrobat' name,  291 duration ) b
     WHERE a.album_name = 'Live At Lafayette Music Room, Memphis, April 18, 1974';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'I''m A Legend Tonight' name,  239 duration UNION ALL
            SELECT 'Down On Your Knees' name,  207 duration UNION ALL
            SELECT 'Cold Gin' name,  263 duration UNION ALL
            SELECT 'Love Gun' name,  195 duration UNION ALL
            SELECT 'Shout It Out Loud' name,  159 duration UNION ALL
            SELECT 'Escape From The Island' name,  171 duration UNION ALL
            SELECT 'Talk To Me' name,  242 duration UNION ALL
            SELECT 'Sure Know Something' name,  239 duration UNION ALL
            SELECT 'Nowhere To Run' name,  266 duration UNION ALL
            SELECT 'Partners In Crime' name,  226 duration UNION ALL
            SELECT 'Detroit Rock City' name,  235 duration UNION ALL
            SELECT 'God Of Thunder' name,  256 duration UNION ALL
            SELECT 'I Was Made For Lovin'' You' name,  258 duration UNION ALL
            SELECT 'Shandi' name,  216 duration UNION ALL
            SELECT 'Rock And Roll All Nite' name,  236 duration ) b
     WHERE a.album_name = 'Killers';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Nothin'' To Lose' name,  205 duration UNION ALL
            SELECT 'Let Me Go, Rock ''N Roll' name,  134 duration UNION ALL
            SELECT 'C''mon And Love Me' name,  177 duration UNION ALL
            SELECT 'Rock And Roll All Nite' name,  236 duration UNION ALL
            SELECT 'God Of Thunder' name,  176 duration UNION ALL
            SELECT 'Beth' name,  165 duration UNION ALL
            SELECT 'Hard Luck Woman' name,  211 duration UNION ALL
            SELECT 'Reputation' name,  339 duration UNION ALL
            SELECT 'Christine Sixteen' name,  192 duration UNION ALL
            SELECT 'Shout It Out Loud' name,  194 duration UNION ALL
            SELECT 'Strutter ''78' name,  222 duration UNION ALL
            SELECT 'You Matter To Me' name,  197 duration UNION ALL
            SELECT 'Radioactive' name,  231 duration UNION ALL
            SELECT 'New York Groove' name,  183 duration UNION ALL
            SELECT 'Hold Me, Touch Me (Think Of Me When We''re Apart)' name,  221 duration UNION ALL
            SELECT 'I Was Made For Lovin'' You' name,  239 duration UNION ALL
            SELECT 'Shandi' name,  216 duration UNION ALL
            SELECT 'A World Without Heroes' name,  160 duration UNION ALL
            SELECT 'I Love It Loud' name,  256 duration UNION ALL
            SELECT 'Down On Your Knees' name,  207 duration UNION ALL
            SELECT 'Lick It Up' name,  236 duration UNION ALL
            SELECT 'Heaven''s On Fire' name,  200 duration ) b
     WHERE a.album_name = 'KISS 40';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Hell Or Hallelujah' name,  247 duration UNION ALL
            SELECT 'Wall Of Sound' name,  175 duration UNION ALL
            SELECT 'Freak' name,  215 duration UNION ALL
            SELECT 'Back To The Stone Age' name,  181 duration UNION ALL
            SELECT 'Shout Mercy' name,  244 duration UNION ALL
            SELECT 'Long Way Down' name,  231 duration UNION ALL
            SELECT 'Eat Your Heart Out' name,  246 duration UNION ALL
            SELECT 'The Devil Is Me' name,  221 duration UNION ALL
            SELECT 'Outta This World' name,  269 duration UNION ALL
            SELECT 'All For The Love Of Rock & Roll' name,  201 duration UNION ALL
            SELECT 'Take Me Down Below' name,  204 duration UNION ALL
            SELECT 'Last Chance' name,  185 duration ) b
     WHERE a.album_name = 'Monster';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Detroit Rock City' name,  315 duration UNION ALL
            SELECT 'King Of The Night Time World' name,  199 duration UNION ALL
            SELECT 'God Of Thunder' name,  253 duration UNION ALL
            SELECT 'Great Expectations' name,  262 duration UNION ALL
            SELECT 'Flaming Youth' name,  177 duration UNION ALL
            SELECT 'Sweet Pain' name,  199 duration UNION ALL
            SELECT 'Shout It Out Loud' name,  168 duration UNION ALL
            SELECT 'Beth' name,  166 duration UNION ALL
            SELECT 'Do You Love Me' name,  212 duration UNION ALL
            SELECT 'Rock And Roll Party' name,  84 duration UNION ALL
            SELECT 'Sweet Pain' name,  198 duration ) b
     WHERE a.album_name = 'Destroyer (Resurrected)';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'God Of Thunder' name,  256 duration UNION ALL
            SELECT 'Almost Human' name,  167 duration UNION ALL
            SELECT 'Calling Dr. Love' name,  225 duration UNION ALL
            SELECT 'Ladies Room' name,  208 duration UNION ALL
            SELECT 'Christine Sixteen' name,  192 duration UNION ALL
            SELECT 'Deuce' name,  185 duration UNION ALL
            SELECT 'Rock And Roll All Nite' name,  175 duration UNION ALL
            SELECT 'Cold Gin' name,  263 duration UNION ALL
            SELECT 'Parasite' name,  183 duration UNION ALL
            SELECT 'Larger Than Life' name,  240 duration UNION ALL
            SELECT 'Love ''Em And Leave ''Em' name,  227 duration UNION ALL
            SELECT 'Plaster Caster' name,  208 duration UNION ALL
            SELECT 'Radioactive' name,  231 duration UNION ALL
            SELECT 'Charisma' name,  265 duration ) b
     WHERE a.album_name = 'Ikons';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Deuce' name,  234 duration UNION ALL
            SELECT 'Strutter' name,  202 duration UNION ALL
            SELECT 'Got To Choose' name,  232 duration UNION ALL
            SELECT 'Hotter Than Hell' name,  198 duration UNION ALL
            SELECT 'Firehouse' name,  230 duration UNION ALL
            SELECT 'Nothin'' To Lose' name,  214 duration UNION ALL
            SELECT 'C''mon And Love Me' name,  184 duration UNION ALL
            SELECT 'Parasite' name,  215 duration UNION ALL
            SELECT 'She' name,  407 duration UNION ALL
            SELECT 'Watchin'' You' name,  229 duration UNION ALL
            SELECT '100,000 Years' name,  729 duration UNION ALL
            SELECT 'Black Diamond' name,  360 duration UNION ALL
            SELECT 'Rock Bottom' name,  203 duration UNION ALL
            SELECT 'Cold Gin' name,  436 duration UNION ALL
            SELECT 'Rock And Roll All Nite' name,  236 duration UNION ALL
            SELECT 'Let Me Go, Rock ''N Roll' name,  344 duration ) b
     WHERE a.album_name = 'Alive! 1975-2000';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Psycho Circus' name,  333 duration UNION ALL
            SELECT 'Shout It Out Loud' name,  196 duration UNION ALL
            SELECT 'Deuce' name,  225 duration UNION ALL
            SELECT 'Heaven''s On Fire' name,  254 duration UNION ALL
            SELECT 'Into The Void' name,  265 duration UNION ALL
            SELECT 'Firehouse' name,  239 duration UNION ALL
            SELECT 'Do You Love Me' name,  234 duration UNION ALL
            SELECT 'Let Me Go Rock ''N'' Roll' name,  316 duration UNION ALL
            SELECT 'I Love It Loud' name,  204 duration UNION ALL
            SELECT 'Lick It Up' name,  279 duration UNION ALL
            SELECT '100,000 Years' name,  347 duration UNION ALL
            SELECT 'Love Gun' name,  257 duration UNION ALL
            SELECT 'Black Diamond' name,  328 duration UNION ALL
            SELECT 'Beth' name,  162 duration UNION ALL
            SELECT 'Rock And Roll All Nite' name,  341 duration UNION ALL
            SELECT '2000 Man' name,  328 duration UNION ALL
            SELECT 'God Of Thunder' name,  295 duration ) b
     WHERE a.album_name = 'Alive: The Millennium Concert';

 -----------------------------------------------------------------------------

INSERT INTO album(release_date, album_name) VALUES
    (to_date('2022-10-07', 'yyyy-mm-dd'), 'Call on me'),
    (to_date('2022-08-26', 'yyyy-mm-dd'), 'Groundwork'),
    (to_date('2022-02-11', 'yyyy-mm-dd'), 'The Joker And The Queen'),
    (to_date('2021-12-23', 'yyyy-mm-dd'), 'Peru'),
    (to_date('2021-12-17', 'yyyy-mm-dd'), 'Sausage Rolls for Everyone'),
    (to_date('2021-12-03', 'yyyy-mm-dd'), 'Merry Christmas'),
    (to_date('2021-12-01', 'yyyy-mm-dd'), 'Shivers'),
    (to_date('2021-10-29', 'yyyy-mm-dd'), '='),
    (to_date('2021-10-28', 'yyyy-mm-dd'), 'Overpass Graffiti'),
    (to_date('2021-10-27', 'yyyy-mm-dd'), 'Shivers'),
    (to_date('2021-10-26', 'yyyy-mm-dd'), 'Shivers'),
    (to_date('2021-10-25', 'yyyy-mm-dd'), 'Shivers'),
    (to_date('2021-10-11', 'yyyy-mm-dd'), 'Shivers'),
    (to_date('2021-10-08', 'yyyy-mm-dd'), 'Shivers'),
    (to_date('2021-10-01', 'yyyy-mm-dd'), 'Shivers'),
    (to_date('2021-08-12', 'yyyy-mm-dd'), 'Bad Habits'),
    (to_date('2020-12-21', 'yyyy-mm-dd'), 'Afterglow'),
    (to_date('2020-11-13', 'yyyy-mm-dd'), 'Im a Star'),
    (to_date('2020-09-25', 'yyyy-mm-dd'), 'Raise Em Up'),
    (to_date('2019-12-11', 'yyyy-mm-dd'), 'Own It'),
    (to_date('2019-08-12', 'yyyy-mm-dd'), 'Red Hot Chilli Peppers Anthology Vol .2'),
    (to_date('2019-08-12', 'yyyy-mm-dd'), 'Red Hot Chili Peppers Anthology Vol .1'),
    (to_date('2016-06-17', 'yyyy-mm-dd'), 'The Getaway'),
    (to_date('2014-12-12', 'yyyy-mm-dd'), 'The Studio Album Collection 1991-2011'),
    (to_date('2013-07-23', 'yyyy-mm-dd'), 'Catch My Death / How It Ends'),
    (to_date('2013-07-23', 'yyyy-mm-dd'), 'This Is the Kitt / Brave from Afar'),
    (to_date('2013-07-23', 'yyyy-mm-dd'), 'Hanalei / Open/Close'),
    (to_date('2013-02-01', 'yyyy-mm-dd'), 'In Love Dying'),
    (to_date('2013-01-04', 'yyyy-mm-dd'), 'Pink as Floyd / Your Eyes Girl'),
    (to_date('2012-11-02', 'yyyy-mm-dd'), 'The Sunset Sleeps / Hometown Gypsy'),
    (to_date('2012-09-28', 'yyyy-mm-dd'), 'Never Is a Long Time / Love of Your Life'),
    (to_date('2012-09-07', 'yyyy-mm-dd'), 'Magpies on Fire / Victorian Machinery'),
    (to_date('2012-08-07', 'yyyy-mm-dd'), 'Strange Man / Long Progression'),
    (to_date('2012-05-01', 'yyyy-mm-dd'), 'Rock & Roll Hall of Fame Covers - EP'),
    (to_date('2011-08-26', 'yyyy-mm-dd'), 'I''m with You'),
    (to_date('2006-12-19', 'yyyy-mm-dd'), 'Snow ((Hey Oh))'),
    (to_date('2006-12-19', 'yyyy-mm-dd'), 'Tell Me Baby'),
    (to_date('2006-12-19', 'yyyy-mm-dd'), 'Dani California'),
    (to_date('2006-05-05', 'yyyy-mm-dd'), 'Stadium Arcadium'),
    (to_date('2003-11-17', 'yyyy-mm-dd'), 'Greatest Hits'),
    (to_date('2019-12-12', 'yyyy-mm-dd'), 'The Classics of Led Zeppelin'),
    (to_date('2019-12-12', 'yyyy-mm-dd'), 'The Best of Led Zeppelin'),
    (to_date('2018-09-27', 'yyyy-mm-dd'), 'Led Zeppelin x Led Zeppelin'),
    (to_date('2012-11-16', 'yyyy-mm-dd'), 'Celebration Day'),
    (to_date('2013-12-01', 'yyyy-mm-dd'), 'Mothership'),
    (to_date('2003-05-27', 'yyyy-mm-dd'), 'How the West Was Won'),
    (to_date('2016-09-16', 'yyyy-mm-dd'), 'The Complete BBC Sessions'),
    (to_date('2015-07-31', 'yyyy-mm-dd'), 'Coda'),
    (to_date('2015-07-30', 'yyyy-mm-dd'), 'In Through the out Door'),
    (to_date('2015-07-29', 'yyyy-mm-dd'), 'Presence'),
    (to_date('1976-10-22', 'yyyy-mm-dd'), 'The Song Remains the Same'),
    (to_date('2015-02-24', 'yyyy-mm-dd'), 'Physical Graffiti'),
    (to_date('1973-03-28', 'yyyy-mm-dd'), 'Houses of the Holy'),
    (to_date('1971-11-08', 'yyyy-mm-dd'), 'Led Zeppelin IV'),
    (to_date('1971-11-08', 'yyyy-mm-dd'), 'Untitled - Led Zeppelin'),
    (to_date('1970-12-13', 'yyyy-mm-dd'), 'Led Zeppelin III: Companion Audio'),
    (to_date('1970-10-05', 'yyyy-mm-dd'), 'Led Zeppelin III'),
    (to_date('1969-10-22', 'yyyy-mm-dd'), 'Led Zeppelin II'),
    (to_date('1969-10-10', 'yyyy-mm-dd'), 'Live At The Olympia'),
    (to_date('1969-01-12', 'yyyy-mm-dd'), 'Led Zeppelin'),
    (to_date('2016-08-26', 'yyyy-mm-dd'), 'The Best of the Atlantic Years'),
    (to_date('2016-07-22', 'yyyy-mm-dd'), 'Metal Meltdown'),
    (to_date('2016-07-15', 'yyyy-mm-dd'), 'Rock ''N'' Roll Saviors - The Early Years'),
    (to_date('2016-02-19', 'yyyy-mm-dd'), 'Under The Blade'),
    (to_date('2015-11-23', 'yyyy-mm-dd'), 'Train Kept A Rollin'''),
    (to_date('2011-09-19', 'yyyy-mm-dd'), 'Live at the Marquee Club'),
    (to_date('2008-01-01', 'yyyy-mm-dd'), 'Official Singles'),
    (to_date('2007-06-26', 'yyyy-mm-dd'), 'Rhino Hi-Five: Twisted Sister'),
    (to_date('2006-10-17', 'yyyy-mm-dd'), 'A Twisted Christmas'),
    (to_date('2004-10-19', 'yyyy-mm-dd'), 'Still Hungry'),
    (to_date('2002-09-17', 'yyyy-mm-dd'), 'Twisted Sister: Essentials'),
    (to_date('2001-11-06', 'yyyy-mm-dd'), 'Club Daze, Volume II: Live in the Bars'),
    (to_date('1999-01-01', 'yyyy-mm-dd'), 'Club Daze, Volume 1: The Studio Sessions'),
    (to_date('1994-10-03', 'yyyy-mm-dd'), 'Live at Hammersmith'),
    (to_date('1992-03-17', 'yyyy-mm-dd'), 'Big Hits and Nasty Cuts'),
    (to_date('2016-03-25', 'yyyy-mm-dd'), 'Love Is for Suckers'),
    (to_date('1985-11-09', 'yyyy-mm-dd'), 'Come Out and Play'),
    (to_date('1984-05-10', 'yyyy-mm-dd'), 'Stay Hungry'),
    (to_date('1983-05-01', 'yyyy-mm-dd'), 'You Can''t Stop Rock ''N'' Roll');


INSERT INTO album_artist(album, artist)
            SELECT al.id album,
                   ar.id artist
              FROM album al
                   CROSS JOIN artist ar
             WHERE al.album_name IN ('Call on me', 'Groundwork', 'The Joker And The Queen', 'Peru', 'Sausage Rolls for Everyone', 'Merry Christmas', 'Shivers', '=', 'Overpass Graffiti', 'Shivers', 'Shivers', 'Shivers', 'Shivers', 'Shivers', 'Shivers', 'Bad Habits', 'Afterglow', 'Im a Star', 'Raise Em Up', 'Own It')
               AND ar.artist_name = 'Ed Sheeran';

INSERT INTO album_artist(album, artist)
            SELECT al.id album,
                   ar.id artist
              FROM album al
                   CROSS JOIN artist ar
             WHERE al.album_name IN ('Red Hot Chilli Peppers Anthology Vol .2', 'Red Hot Chili Peppers Anthology Vol .1', 'The Getaway', 'The Studio Album Collection 1991-2011', 'Catch My Death / How It Ends', 'This Is the Kitt / Brave from Afar', 'Hanalei / Open/Close', 'In Love Dying', 'Pink as Floyd / Your Eyes Girl', 'The Sunset Sleeps / Hometown Gypsy', 'Never Is a Long Time / Love of Your Life', 'Magpies on Fire / Victorian Machinery', 'Strange Man / Long Progression', 'Rock & Roll Hall of Fame Covers - EP', 'I''m with You', 'Snow ((Hey Oh))', 'Tell Me Baby', 'Dani California', 'Stadium Arcadium', 'Greatest Hits')
               AND ar.artist_name = 'Red Hot Chili Peppers';

INSERT INTO album_artist(album, artist)
            SELECT al.id album,
                   ar.id artist
              FROM album al
                   CROSS JOIN artist ar
             WHERE al.album_name IN ('The Classics of Led Zeppelin', 'The Best of Led Zeppelin', 'Led Zeppelin x Led Zeppelin', 'Celebration Day', 'Mothership', 'How the West Was Won', 'The Complete BBC Sessions', 'Coda', 'In Through the out Door', 'Presence', 'The Song Remains the Same', 'Physical Graffiti', 'Houses of the Holy', 'Led Zeppelin IV', 'Untitled - Led Zeppelin', 'Led Zeppelin III: Companion Audio', 'Led Zeppelin III', 'Led Zeppelin II', 'Live At The Olympia', 'Led Zeppelin')
               AND ar.artist_name = 'Led Zeppelin';

INSERT INTO album_artist(album, artist)
            SELECT al.id album,
                   ar.id artist
              FROM album al
                   CROSS JOIN artist ar
             WHERE al.album_name IN ('The Best of the Atlantic Years', 'Metal Meltdown', 'Rock ''N'' Roll Saviors - The Early Years', 'Under The Blade', 'Train Kept A Rollin''', 'Live at the Marquee Club', 'Official Singles', 'Rhino Hi-Five: Twisted Sister', 'A Twisted Christmas', 'Still Hungry', 'Twisted Sister: Essentials', 'Club Daze, Volume II: Live in the Bars', 'Club Daze, Volume 1: The Studio Sessions', 'Live at Hammersmith', 'Big Hits and Nasty Cuts', 'Love Is for Suckers', 'Come Out and Play', 'Stay Hungry', 'You Can''t Stop Rock ''N'' Roll')
               AND ar.artist_name = 'Twisted Sister';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Call on me' name,  200 duration ) b
     WHERE a.album_name = 'Call on me';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Groundwork' name,  208 duration ) b
     WHERE a.album_name = 'Groundwork';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'The Joker And The Queen' name,  185 duration ) b
     WHERE a.album_name = 'The Joker And The Queen';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Peru' name,  187 duration ) b
     WHERE a.album_name = 'Peru';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Sausage Rolls for Everyone' name,  207 duration ) b
     WHERE a.album_name = 'Sausage Rolls for Everyone';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Merry Christmas' name,  208 duration ) b
     WHERE a.album_name = 'Merry Christmas';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Shivers' name,  166 duration ) b
     WHERE a.album_name = 'Shivers';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Tides' name,  195 duration UNION ALL
            SELECT 'Shivers' name,  207 duration UNION ALL
            SELECT 'First Times' name,  185 duration UNION ALL
            SELECT 'Bad Habits' name,  230 duration UNION ALL
            SELECT 'Overpass Graffiti' name,  236 duration UNION ALL
            SELECT 'The Joker And The Queen' name,  185 duration UNION ALL
            SELECT 'Leave Your Life' name,  223 duration UNION ALL
            SELECT 'Collide' name,  210 duration UNION ALL
            SELECT '2step' name,  153 duration UNION ALL
            SELECT 'Stop The Rain' name,  203 duration UNION ALL
            SELECT 'Love In Slow Motion' name,  190 duration UNION ALL
            SELECT 'Visiting Hours' name,  215 duration UNION ALL
            SELECT 'Sandman' name,  259 duration UNION ALL
            SELECT 'Be Right Now' name,  211 duration ) b
     WHERE a.album_name = '=';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Overpass Graffiti' name,  203 duration ) b
     WHERE a.album_name = 'Overpass Graffiti';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Shivers' name,  127 duration UNION ALL
            SELECT 'Shivers' name,  127 duration ) b
     WHERE a.album_name = 'Shivers';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Shivers' name,  340 duration ) b
     WHERE a.album_name = 'Shivers';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Shivers' name,  207 duration ) b
     WHERE a.album_name = 'Shivers';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Shivers' name,  172 duration ) b
     WHERE a.album_name = 'Shivers';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Shivers' name,  187 duration ) b
     WHERE a.album_name = 'Shivers';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Shivers' name,  155 duration ) b
     WHERE a.album_name = 'Shivers';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Bad Habits' name,  222 duration ) b
     WHERE a.album_name = 'Bad Habits';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Afterglow' name,  185 duration ) b
     WHERE a.album_name = 'Afterglow';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Im a Star' name,  180 duration ) b
     WHERE a.album_name = 'Im a Star';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Raise Em Up' name,  212 duration UNION ALL
            SELECT 'Raise Em Up' name,  212 duration ) b
     WHERE a.album_name = 'Raise Em Up';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Own It' name,  176 duration ) b
     WHERE a.album_name = 'Own It';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Grand Pappy Du Plenty' name,  104 duration UNION ALL
            SELECT 'Warped' name,  353 duration UNION ALL
            SELECT 'Stone Club Bush' name,  291 duration UNION ALL
            SELECT 'My Lovely Man' name,  318 duration UNION ALL
            SELECT 'Me and My Friends' name,  518 duration UNION ALL
            SELECT 'If You Have to Ask' name,  268 duration UNION ALL
            SELECT 'Give It Away' name,  395 duration UNION ALL
            SELECT 'Suck My Kiss' name,  282 duration UNION ALL
            SELECT 'Blood Sugar Sex Magik' name,  312 duration UNION ALL
            SELECT 'Higher Ground' name,  314 duration UNION ALL
            SELECT 'Aeroplane' name,  289 duration UNION ALL
            SELECT 'Organic Anti-Beat Box Band' name,  337 duration UNION ALL
            SELECT 'Pea' name,  132 duration UNION ALL
            SELECT 'Under the Bridge' name,  290 duration UNION ALL
            SELECT 'Power of Equality' name,  281 duration ) b
     WHERE a.album_name = 'Red Hot Chilli Peppers Anthology Vol .2';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Higher Ground' name,  212 duration UNION ALL
            SELECT 'Knock Me Down' name,  233 duration UNION ALL
            SELECT 'Castles Made Of Sand' name,  195 duration UNION ALL
            SELECT 'Give It Away' name,  287 duration UNION ALL
            SELECT 'Me And My Friends/My Mind' name,  186 duration UNION ALL
            SELECT 'Love Trilogy' name,  236 duration UNION ALL
            SELECT 'Suck My Kiss' name,  212 duration UNION ALL
            SELECT 'Blood Sugar Sex Magik' name,  262 duration UNION ALL
            SELECT 'Bullet Proof' name,  120 duration UNION ALL
            SELECT 'Crosstown Traffic' name,  169 duration UNION ALL
            SELECT 'Organic Anti Beat Box Band' name,  243 duration ) b
     WHERE a.album_name = 'Red Hot Chili Peppers Anthology Vol .1';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'The Getaway' name,  250 duration UNION ALL
            SELECT 'Dark Necessities' name,  302 duration UNION ALL
            SELECT 'We Turn Red' name,  200 duration UNION ALL
            SELECT 'The Longest Wave' name,  211 duration UNION ALL
            SELECT 'Goodbye Angels' name,  268 duration UNION ALL
            SELECT 'Sick Love' name,  221 duration UNION ALL
            SELECT 'Go Robot' name,  263 duration UNION ALL
            SELECT 'Feasting on the Flowers' name,  202 duration UNION ALL
            SELECT 'Detroit' name,  226 duration UNION ALL
            SELECT 'This Ticonderoga' name,  215 duration UNION ALL
            SELECT 'Encore' name,  254 duration UNION ALL
            SELECT 'The Hunter' name,  240 duration UNION ALL
            SELECT 'Dreams of a Samurai' name,  369 duration ) b
     WHERE a.album_name = 'The Getaway';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'The Power of Equality' name,  243 duration UNION ALL
            SELECT 'If You Have to Ask' name,  216 duration UNION ALL
            SELECT 'Breaking the Girl' name,  294 duration UNION ALL
            SELECT 'Funky Monks' name,  323 duration UNION ALL
            SELECT 'Suck My Kiss' name,  215 duration UNION ALL
            SELECT 'I Could Have Lied' name,  244 duration UNION ALL
            SELECT 'Mellowship Slinky in B Major' name,  239 duration UNION ALL
            SELECT 'The Righteous & the Wicked' name,  248 duration UNION ALL
            SELECT 'Give It Away' name,  284 duration UNION ALL
            SELECT 'Blood Sugar Sex Magik' name,  271 duration UNION ALL
            SELECT 'Under the Bridge' name,  265 duration UNION ALL
            SELECT 'Naked in the Rain' name,  265 duration UNION ALL
            SELECT 'Apache Rose Peacock' name,  282 duration UNION ALL
            SELECT 'The Greeting Song' name,  193 duration UNION ALL
            SELECT 'My Lovely Man' name,  279 duration UNION ALL
            SELECT 'Sir Psycho Sexy' name,  496 duration UNION ALL
            SELECT 'They''re Red Hot' name,  71 duration ) b
     WHERE a.album_name = 'The Studio Album Collection 1991-2011';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Catch My Death' name,  256 duration UNION ALL
            SELECT 'How It Ends' name,  218 duration ) b
     WHERE a.album_name = 'Catch My Death / How It Ends';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'This Is the Kitt' name,  261 duration UNION ALL
            SELECT 'Brave from Afar' name,  219 duration ) b
     WHERE a.album_name = 'This Is the Kitt / Brave from Afar';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Hanalei' name,  255 duration UNION ALL
            SELECT 'Open/Close' name,  263 duration ) b
     WHERE a.album_name = 'Hanalei / Open/Close';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'In Love Dying' name,  481 duration ) b
     WHERE a.album_name = 'In Love Dying';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Pink as Floyd' name,  293 duration UNION ALL
            SELECT 'Your Eyes Girl' name,  307 duration ) b
     WHERE a.album_name = 'Pink as Floyd / Your Eyes Girl';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'The Sunset Sleeps' name,  239 duration UNION ALL
            SELECT 'Hometown Gypsy' name,  238 duration ) b
     WHERE a.album_name = 'The Sunset Sleeps / Hometown Gypsy';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Never Is a Long Time' name,  166 duration UNION ALL
            SELECT 'Love of Your Life' name,  246 duration ) b
     WHERE a.album_name = 'Never Is a Long Time / Love of Your Life';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Magpies on Fire' name,  224 duration UNION ALL
            SELECT 'Victorian Machinery' name,  246 duration ) b
     WHERE a.album_name = 'Magpies on Fire / Victorian Machinery';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Strange Man' name,  216 duration UNION ALL
            SELECT 'Long Progression' name,  238 duration ) b
     WHERE a.album_name = 'Strange Man / Long Progression';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'A Teenager in Love' name,  180 duration UNION ALL
            SELECT 'Havana Affair' name,  139 duration UNION ALL
            SELECT 'Search and Destroy' name,  212 duration UNION ALL
            SELECT 'Everybody Knows This Is Nowhere' name,  137 duration UNION ALL
            SELECT 'I Get Around' name,  139 duration UNION ALL
            SELECT 'Suffragette City' name,  222 duration ) b
     WHERE a.album_name = 'Rock & Roll Hall of Fame Covers - EP';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Monarchy of Roses' name,  251 duration UNION ALL
            SELECT 'Factory of Faith' name,  259 duration UNION ALL
            SELECT 'Brendan''s Death Song' name,  338 duration UNION ALL
            SELECT 'Ethiopia' name,  230 duration UNION ALL
            SELECT 'Annie Wants a Baby' name,  220 duration UNION ALL
            SELECT 'Look Around' name,  208 duration UNION ALL
            SELECT 'The Adventures of Rain Dance Maggie' name,  282 duration UNION ALL
            SELECT 'Did I Let You Know' name,  261 duration UNION ALL
            SELECT 'Goodbye Hooray' name,  232 duration UNION ALL
            SELECT 'Happiness Loves Company' name,  213 duration UNION ALL
            SELECT 'Police Station' name,  335 duration UNION ALL
            SELECT 'Even You Brutus?' name,  241 duration UNION ALL
            SELECT 'Meet Me at the Corner' name,  261 duration UNION ALL
            SELECT 'Dance, Dance, Dance' name,  225 duration ) b
     WHERE a.album_name = 'I''m with You';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Snow (Hey Oh)' name,  335 duration UNION ALL
            SELECT 'Funny Face' name,  286 duration UNION ALL
            SELECT 'I''ll Be Your Domino' name,  234 duration UNION ALL
            SELECT 'Permutation' name,  221 duration ) b
     WHERE a.album_name = 'Snow ((Hey Oh))';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Tell Me Baby' name,  247 duration UNION ALL
            SELECT 'Mercy Mercy' name,  239 duration UNION ALL
            SELECT 'A Certain Someone' name,  144 duration UNION ALL
            SELECT 'Lyon 6.6.06' name,  233 duration ) b
     WHERE a.album_name = 'Tell Me Baby';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Dani California' name,  283 duration UNION ALL
            SELECT 'Whatever We Want' name,  287 duration UNION ALL
            SELECT 'Lately' name,  175 duration UNION ALL
            SELECT 'Million Miles of Water' name,  244 duration ) b
     WHERE a.album_name = 'Dani California';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Dani California' name,  283 duration UNION ALL
            SELECT 'Snow (Hey Oh)' name,  335 duration UNION ALL
            SELECT 'Charlie' name,  277 duration UNION ALL
            SELECT 'Stadium Arcadium' name,  314 duration UNION ALL
            SELECT 'Hump de Bump' name,  213 duration UNION ALL
            SELECT 'She''s Only 18' name,  205 duration UNION ALL
            SELECT 'Slow Cheetah' name,  319 duration UNION ALL
            SELECT 'Torture Me' name,  224 duration UNION ALL
            SELECT 'Strip My Mind' name,  259 duration UNION ALL
            SELECT 'Especially in Michigan' name,  240 duration UNION ALL
            SELECT 'Warlocks' name,  205 duration UNION ALL
            SELECT 'C''mon Girl' name,  228 duration UNION ALL
            SELECT 'Wet Sand' name,  309 duration UNION ALL
            SELECT 'Hey' name,  339 duration ) b
     WHERE a.album_name = 'Stadium Arcadium';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Under the Bridge' name,  265 duration UNION ALL
            SELECT 'Give It Away' name,  284 duration UNION ALL
            SELECT 'Californication' name,  329 duration UNION ALL
            SELECT 'Scar Tissue' name,  215 duration UNION ALL
            SELECT 'Soul to Squeeze' name,  289 duration UNION ALL
            SELECT 'Otherside' name,  255 duration UNION ALL
            SELECT 'Suck My Kiss' name,  215 duration UNION ALL
            SELECT 'By the Way' name,  215 duration UNION ALL
            SELECT 'Parallel Universe' name,  269 duration UNION ALL
            SELECT 'Breaking the Girl' name,  294 duration UNION ALL
            SELECT 'My Friends' name,  249 duration UNION ALL
            SELECT 'Higher Ground' name,  203 duration UNION ALL
            SELECT 'Universally Speaking' name,  256 duration UNION ALL
            SELECT 'Road Trippin''' name,  204 duration UNION ALL
            SELECT 'Fortune Faded' name,  201 duration UNION ALL
            SELECT 'Save the Population' name,  245 duration ) b
     WHERE a.album_name = 'Greatest Hits';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Good Times Bad Times' name,  167 duration UNION ALL
            SELECT 'You Shook Me' name,  388 duration UNION ALL
            SELECT 'Your Time Is Gonna Come' name,  274 duration UNION ALL
            SELECT 'Black Mountain Side' name,  132 duration UNION ALL
            SELECT 'I Can''t Quit You Baby' name,  282 duration UNION ALL
            SELECT 'How Many More Times' name,  509 duration UNION ALL
            SELECT 'Since I''ve Been Loving You' name,  444 duration UNION ALL
            SELECT 'Out on the Tiles' name,  247 duration UNION ALL
            SELECT 'Gallows Pole' name,  297 duration UNION ALL
            SELECT 'Bron-Y-Aur Stomp' name,  257 duration UNION ALL
            SELECT 'Hats off to (Roy) Harper' name,  224 duration UNION ALL
            SELECT 'Bathroom Sound' name,  241 duration UNION ALL
            SELECT 'Tangerine' name,  191 duration UNION ALL
            SELECT 'That''s the Way' name,  337 duration ) b
     WHERE a.album_name = 'The Classics of Led Zeppelin';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Immigrant Song' name,  147 duration UNION ALL
            SELECT 'Friends' name,  234 duration UNION ALL
            SELECT 'Out on the Tiles' name,  247 duration UNION ALL
            SELECT 'Gallows Pole' name,  297 duration UNION ALL
            SELECT 'Tangerine' name,  191 duration UNION ALL
            SELECT 'Friends' name,  223 duration UNION ALL
            SELECT 'Celebration Day' name,  199 duration UNION ALL
            SELECT 'Gallows Pole' name,  320 duration UNION ALL
            SELECT 'That''s the Way' name,  323 duration UNION ALL
            SELECT 'Good Times Bad Times' name,  167 duration UNION ALL
            SELECT 'Babe I''m Gonna Leave You' name,  402 duration UNION ALL
            SELECT 'Your Time Is Gonna Come' name,  274 duration UNION ALL
            SELECT 'Black Mountain Side' name,  132 duration UNION ALL
            SELECT 'How Many More Times' name,  509 duration ) b
     WHERE a.album_name = 'The Best of Led Zeppelin';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Immigrant Song' name,  146 duration UNION ALL
            SELECT 'Rock and Roll' name,  223 duration UNION ALL
            SELECT 'Whole Lotta Love' name,  334 duration UNION ALL
            SELECT 'Black Dog' name,  295 duration UNION ALL
            SELECT 'Stairway to Heaven' name,  482 duration UNION ALL
            SELECT 'Good Times Bad Times' name,  166 duration UNION ALL
            SELECT 'Going to California' name,  212 duration UNION ALL
            SELECT 'Ramble On' name,  273 duration UNION ALL
            SELECT 'Kashmir' name,  517 duration UNION ALL
            SELECT 'Over the Hills and Far Away' name,  290 duration UNION ALL
            SELECT 'Hey, Hey, What Can I Do' name,  236 duration UNION ALL
            SELECT 'D''yer Mak''er' name,  262 duration UNION ALL
            SELECT 'When the Levee Breaks' name,  428 duration UNION ALL
            SELECT 'All My Love' name,  353 duration UNION ALL
            SELECT 'Babe I''m Gonna Leave You' name,  402 duration UNION ALL
            SELECT 'Heartbreaker' name,  254 duration UNION ALL
            SELECT 'Dazed and Confused' name,  388 duration UNION ALL
            SELECT 'The Song Remains the Same' name,  329 duration UNION ALL
            SELECT 'Fool in the Rain' name,  370 duration UNION ALL
            SELECT 'The Ocean' name,  271 duration UNION ALL
            SELECT 'What Is and What Should Never Be' name,  286 duration UNION ALL
            SELECT 'Houses of the Holy' name,  244 duration UNION ALL
            SELECT 'Since I''ve Been Loving You' name,  444 duration UNION ALL
            SELECT 'Misty Mountain Hop' name,  278 duration UNION ALL
            SELECT 'Communication Breakdown' name,  150 duration UNION ALL
            SELECT 'Thank You' name,  289 duration UNION ALL
            SELECT 'No Quarter' name,  422 duration UNION ALL
            SELECT 'Trampled Under Foot' name,  336 duration UNION ALL
            SELECT 'I Can''t Quit You Baby' name,  282 duration UNION ALL
            SELECT 'In the Evening' name,  413 duration ) b
     WHERE a.album_name = 'Led Zeppelin x Led Zeppelin';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Good Times Bad Times' name,  191 duration UNION ALL
            SELECT 'Ramble On' name,  344 duration UNION ALL
            SELECT 'Black Dog' name,  353 duration UNION ALL
            SELECT 'In My Time of Dying' name,  670 duration UNION ALL
            SELECT 'For Your Life' name,  400 duration UNION ALL
            SELECT 'Trampled Under Foot' name,  379 duration UNION ALL
            SELECT 'Nobody''s Fault but Mine' name,  403 duration UNION ALL
            SELECT 'No Quarter' name,  561 duration UNION ALL
            SELECT 'Since I''ve Been Loving You' name,  472 duration UNION ALL
            SELECT 'Dazed and Confused' name,  704 duration UNION ALL
            SELECT 'Stairway to Heaven' name,  529 duration UNION ALL
            SELECT 'The Song Remains the Same' name,  346 duration UNION ALL
            SELECT 'Misty Mountain Hop' name,  308 duration UNION ALL
            SELECT 'Kashmir' name,  546 duration UNION ALL
            SELECT 'Whole Lotta Love' name,  446 duration UNION ALL
            SELECT 'Rock and Roll' name,  274 duration ) b
     WHERE a.album_name = 'Celebration Day';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Good Times Bad Times' name,  167 duration UNION ALL
            SELECT 'Communication Breakdown' name,  148 duration UNION ALL
            SELECT 'Dazed and Confused' name,  388 duration UNION ALL
            SELECT 'Babe I''m Gonna Leave You' name,  402 duration UNION ALL
            SELECT 'Whole Lotta Love' name,  329 duration UNION ALL
            SELECT 'Ramble On' name,  268 duration UNION ALL
            SELECT 'Heartbreaker' name,  255 duration UNION ALL
            SELECT 'Immigrant Song' name,  146 duration UNION ALL
            SELECT 'Since I''ve Been Loving You' name,  444 duration UNION ALL
            SELECT 'Rock and Roll' name,  220 duration UNION ALL
            SELECT 'Black Dog' name,  295 duration UNION ALL
            SELECT 'When the Levee Breaks' name,  430 duration UNION ALL
            SELECT 'Stairway to Heaven' name,  485 duration ) b
     WHERE a.album_name = 'Mothership';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'LA Drone' name,  14 duration UNION ALL
            SELECT 'Immigrant Song' name,  221 duration UNION ALL
            SELECT 'Heartbreaker' name,  443 duration UNION ALL
            SELECT 'Black Dog' name,  340 duration UNION ALL
            SELECT 'Over the Hills and Far Away' name,  307 duration UNION ALL
            SELECT 'Since I''ve Been Loving You' name,  481 duration UNION ALL
            SELECT 'Stairway to Heaven' name,  577 duration UNION ALL
            SELECT 'Going to California' name,  337 duration UNION ALL
            SELECT 'That''s The Way' name,  353 duration UNION ALL
            SELECT 'Bron-Y-Aur Stomp' name,  293 duration ) b
     WHERE a.album_name = 'How the West Was Won';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'You Shook Me (23/3/69 Top Gear)' name,  314 duration UNION ALL
            SELECT 'I Can''t Quit You Baby (23/3/69 Top Gear)' name,  263 duration UNION ALL
            SELECT 'Communication Breakdown' name,  191 duration UNION ALL
            SELECT 'Dazed and Confused (3/23/69 Top Gear)' name,  399 duration UNION ALL
            SELECT 'The Girl I Love She Got Long Black Wavy Hair' name,  183 duration UNION ALL
            SELECT 'What Is and What Should Never Be (29/6/69 Top Gear)' name,  260 duration UNION ALL
            SELECT 'Communication Breakdown (29/6/69 Top Gear)' name,  160 duration UNION ALL
            SELECT 'Travelling Riverside Blues (29/6/69 Top Gear)' name,  310 duration UNION ALL
            SELECT 'Whole Lotta Love (29/6/69 Top Gear)' name,  370 duration UNION ALL
            SELECT 'Somethin'' Else' name,  126 duration UNION ALL
            SELECT 'Communication Breakdown (10/8/69 Playhouse Theatre)' name,  184 duration UNION ALL
            SELECT 'I Can''t Quit You Baby (10/8/69 Playhouse Theatre)' name,  380 duration UNION ALL
            SELECT 'You Shook Me (10/8/69 Playhouse Theatre)' name,  613 duration UNION ALL
            SELECT 'How Many More Times (10/8/69 Playhouse Theatre)' name,  698 duration ) b
     WHERE a.album_name = 'The Complete BBC Sessions';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'We''re Gonna Groove' name,  158 duration UNION ALL
            SELECT 'Poor Tom' name,  182 duration UNION ALL
            SELECT 'I Can''t Quit You Baby' name,  258 duration UNION ALL
            SELECT 'Walter''s Walk' name,  271 duration UNION ALL
            SELECT 'Ozone Baby' name,  216 duration UNION ALL
            SELECT 'Darlene' name,  306 duration UNION ALL
            SELECT 'Bonzo''s Montreux' name,  262 duration UNION ALL
            SELECT 'Wearing and Tearing' name,  329 duration ) b
     WHERE a.album_name = 'Coda';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'In the Evening' name,  413 duration UNION ALL
            SELECT 'South Bound Saurez' name,  253 duration UNION ALL
            SELECT 'Fool in the Rain' name,  370 duration UNION ALL
            SELECT 'Hot Dog' name,  198 duration UNION ALL
            SELECT 'Carouselambra' name,  634 duration UNION ALL
            SELECT 'All My Love' name,  353 duration UNION ALL
            SELECT 'I''m Gonna Crawl' name,  331 duration ) b
     WHERE a.album_name = 'In Through the out Door';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Achilles Last Stand' name,  631 duration UNION ALL
            SELECT 'For Your Life' name,  385 duration UNION ALL
            SELECT 'Royal Orleans' name,  179 duration UNION ALL
            SELECT 'Nobody''s Fault but Mine' name,  388 duration UNION ALL
            SELECT 'Candy Store Rock' name,  251 duration UNION ALL
            SELECT 'Hots on for Nowhere' name,  284 duration UNION ALL
            SELECT 'Tea for One' name,  568 duration ) b
     WHERE a.album_name = 'Presence';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Rock and Roll' name,  236 duration UNION ALL
            SELECT 'Celebration Day' name,  217 duration UNION ALL
            SELECT 'Black Dog' name,  226 duration UNION ALL
            SELECT 'Over the Hills and Far Away' name,  371 duration UNION ALL
            SELECT 'Misty Mountain Hop' name,  283 duration UNION ALL
            SELECT 'Since I''ve Been Loving You' name,  503 duration UNION ALL
            SELECT 'No Quarter' name,  638 duration UNION ALL
            SELECT 'The Song Remains the Same' name,  339 duration UNION ALL
            SELECT 'The Rain Song' name,  500 duration UNION ALL
            SELECT 'The Ocean' name,  316 duration ) b
     WHERE a.album_name = 'The Song Remains the Same';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Custard Pie' name,  255 duration UNION ALL
            SELECT 'The Rover' name,  339 duration UNION ALL
            SELECT 'In My Time of Dying' name,  668 duration UNION ALL
            SELECT 'Houses of the Holy' name,  244 duration UNION ALL
            SELECT 'Trampled Under Foot' name,  336 duration UNION ALL
            SELECT 'Kashmir' name,  517 duration ) b
     WHERE a.album_name = 'Physical Graffiti';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'The Song Remains the Same' name,  329 duration UNION ALL
            SELECT 'The Rain Song' name,  459 duration UNION ALL
            SELECT 'Over the Hills and Far Away' name,  290 duration UNION ALL
            SELECT 'The Crunge' name,  197 duration UNION ALL
            SELECT 'Dancing Days' name,  223 duration UNION ALL
            SELECT 'D''yer Mak''er' name,  262 duration UNION ALL
            SELECT 'No Quarter' name,  422 duration UNION ALL
            SELECT 'The Ocean' name,  271 duration ) b
     WHERE a.album_name = 'Houses of the Holy';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Black Dog' name,  295 duration UNION ALL
            SELECT 'Rock and Roll' name,  220 duration UNION ALL
            SELECT 'The Battle of Evermore' name,  351 duration UNION ALL
            SELECT 'Stairway to Heaven' name,  482 duration UNION ALL
            SELECT 'Misty Mountain Hop' name,  278 duration UNION ALL
            SELECT 'Four Sticks' name,  285 duration UNION ALL
            SELECT 'Going to California' name,  212 duration UNION ALL
            SELECT 'When the Levee Breaks' name,  428 duration ) b
     WHERE a.album_name = 'Led Zeppelin IV';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Black Dog' name,  296 duration UNION ALL
            SELECT 'Rock and Roll' name,  220 duration UNION ALL
            SELECT 'The Battle of Evermore' name,  351 duration UNION ALL
            SELECT 'Stairway to Heaven' name,  482 duration UNION ALL
            SELECT 'Misty Mountain Hop' name,  278 duration UNION ALL
            SELECT 'Four Sticks' name,  285 duration UNION ALL
            SELECT 'Going to California' name,  212 duration UNION ALL
            SELECT 'When the Levee Breaks' name,  430 duration ) b
     WHERE a.album_name = 'Untitled - Led Zeppelin';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'The Immigrant Song' name,  145 duration UNION ALL
            SELECT 'Friends' name,  223 duration UNION ALL
            SELECT 'Celebration Day' name,  199 duration UNION ALL
            SELECT 'Since I''ve Been Loving You' name,  437 duration UNION ALL
            SELECT 'Bathroom Sound' name,  241 duration UNION ALL
            SELECT 'Gallows Pole' name,  320 duration UNION ALL
            SELECT 'That''s the Way' name,  323 duration UNION ALL
            SELECT 'Jennings Farm Blues' name,  354 duration UNION ALL
            SELECT 'Key to the Highway / Trouble in Mind' name,  247 duration ) b
     WHERE a.album_name = 'Led Zeppelin III: Companion Audio';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Immigrant Song' name,  146 duration UNION ALL
            SELECT 'Friends' name,  233 duration UNION ALL
            SELECT 'Celebration Day' name,  210 duration UNION ALL
            SELECT 'Since I''ve Been Loving You' name,  444 duration UNION ALL
            SELECT 'Out on the Tiles' name,  247 duration UNION ALL
            SELECT 'Gallows Pole' name,  297 duration UNION ALL
            SELECT 'Tangerine' name,  191 duration UNION ALL
            SELECT 'That''s the Way' name,  337 duration UNION ALL
            SELECT 'Bron-Y-Aur Stomp' name,  257 duration UNION ALL
            SELECT 'Hats off To (Roy) Harper' name,  222 duration ) b
     WHERE a.album_name = 'Led Zeppelin III';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Whole Lotta Love' name,  334 duration UNION ALL
            SELECT 'What Is and What Should Never Be' name,  286 duration UNION ALL
            SELECT 'The Lemon Song' name,  379 duration UNION ALL
            SELECT 'Thank You' name,  289 duration UNION ALL
            SELECT 'Heartbreaker' name,  254 duration UNION ALL
            SELECT 'Living Loving Maid (She''s Just a Woman)' name,  159 duration UNION ALL
            SELECT 'Ramble On' name,  273 duration UNION ALL
            SELECT 'Moby Dick' name,  260 duration UNION ALL
            SELECT 'Bring It on Home' name,  259 duration ) b
     WHERE a.album_name = 'Led Zeppelin II';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Good Times Bad Times / Communication Breakdown' name,  232 duration UNION ALL
            SELECT 'I Can''t Quit You Baby' name,  401 duration UNION ALL
            SELECT 'Heartbreaker' name,  229 duration UNION ALL
            SELECT 'Dazed and Confused' name,  901 duration UNION ALL
            SELECT 'White Summer / Black Mountain Side' name,  559 duration UNION ALL
            SELECT 'You Shook Me' name,  715 duration UNION ALL
            SELECT 'Moby Dick' name,  561 duration UNION ALL
            SELECT 'How Many More Times' name,  674 duration ) b
     WHERE a.album_name = 'Live At The Olympia';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Good Times Bad Times' name,  166 duration UNION ALL
            SELECT 'Babe I''m Gonna Leave You' name,  402 duration UNION ALL
            SELECT 'You Shook Me' name,  388 duration UNION ALL
            SELECT 'Dazed and Confused' name,  388 duration UNION ALL
            SELECT 'Your Time Is Gonna Come' name,  274 duration UNION ALL
            SELECT 'Black Mountain Side' name,  132 duration UNION ALL
            SELECT 'Communication Breakdown' name,  150 duration UNION ALL
            SELECT 'I Can''t Quit You Baby' name,  282 duration UNION ALL
            SELECT 'How Many More Times' name,  507 duration ) b
     WHERE a.album_name = 'Led Zeppelin';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'What You Don''t Know (Sure Can Hurt You)' name,  286 duration UNION ALL
            SELECT 'I''ll Never Grow Up, Now!' name,  248 duration UNION ALL
            SELECT 'Sin After Sin' name,  204 duration UNION ALL
            SELECT 'You Can''t Stop Rock ''N'' Roll' name,  282 duration UNION ALL
            SELECT 'I Am (I''m Me)' name,  214 duration UNION ALL
            SELECT 'The Kids Are Back' name,  198 duration UNION ALL
            SELECT 'I Wanna Rock' name,  183 duration UNION ALL
            SELECT 'We''re Not Gonna Take It' name,  217 duration UNION ALL
            SELECT 'The Price' name,  228 duration UNION ALL
            SELECT 'S.M.F.' name,  181 duration UNION ALL
            SELECT 'The Beast' name,  212 duration UNION ALL
            SELECT 'Burn in Hell' name,  283 duration UNION ALL
            SELECT 'Come Out and Play' name,  304 duration UNION ALL
            SELECT 'Leader of the Pack' name,  229 duration UNION ALL
            SELECT 'The Fire Still Burns' name,  213 duration UNION ALL
            SELECT 'You Want What We Got' name,  261 duration UNION ALL
            SELECT 'Hot Love' name,  213 duration UNION ALL
            SELECT 'Love Is for Suckers' name,  206 duration UNION ALL
            SELECT 'Born To Be Wild' name,  208 duration ) b
     WHERE a.album_name = 'The Best of the Atlantic Years';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'What You Don''t Know' name,  315 duration UNION ALL
            SELECT 'The Kids Are Back' name,  175 duration UNION ALL
            SELECT 'Stay Hungry' name,  187 duration UNION ALL
            SELECT 'The Beast' name,  223 duration UNION ALL
            SELECT 'Shoot Em Down' name,  228 duration UNION ALL
            SELECT 'You Can''t Stop Rock ''N'' Roll' name,  251 duration UNION ALL
            SELECT 'I Believe In Rock ''N'' Roll' name,  361 duration UNION ALL
            SELECT 'Under The Blade' name,  273 duration UNION ALL
            SELECT 'I Am (I''m Me)' name,  208 duration UNION ALL
            SELECT 'We''re Not Gonna Take It' name,  266 duration UNION ALL
            SELECT 'The Fire Still Burns' name,  219 duration UNION ALL
            SELECT 'The Price' name,  310 duration UNION ALL
            SELECT 'Burn In Hell' name,  535 duration UNION ALL
            SELECT 'AJ Pero Tribute' name,  80 duration UNION ALL
            SELECT 'I Wanna Rock' name,  522 duration UNION ALL
            SELECT 'Come Out And Play' name,  303 duration UNION ALL
            SELECT 'S.M.F.' name,  307 duration ) b
     WHERE a.album_name = 'Metal Meltdown';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Rock ''N'' Roll Saviors' name,  292 duration UNION ALL
            SELECT 'Pay the Price' name,  257 duration UNION ALL
            SELECT 'Follow Me' name,  217 duration UNION ALL
            SELECT 'Under the Blade' name,  357 duration UNION ALL
            SELECT 'Guitar Solo' name,  101 duration UNION ALL
            SELECT 'Can''t Stand Still' name,  245 duration UNION ALL
            SELECT 'Lady''s Boy' name,  424 duration UNION ALL
            SELECT 'Workin'' on You Baby' name,  241 duration UNION ALL
            SELECT 'Come Back' name,  496 duration UNION ALL
            SELECT 'Without You' name,  166 duration UNION ALL
            SELECT 'Chinese Hustle' name,  134 duration UNION ALL
            SELECT 'I''ll Never Grow up Now' name,  1015 duration UNION ALL
            SELECT 'Plastic Money' name,  251 duration UNION ALL
            SELECT 'Johnny B Goode' name,  189 duration UNION ALL
            SELECT 'Rock ''N'' Roll Saviors' name,  351 duration ) b
     WHERE a.album_name = 'Rock ''N'' Roll Saviors - The Early Years';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'What You Don''t Know (Sure Can Hurt You)' name,  285 duration UNION ALL
            SELECT 'Bad Boys (Of Rock ''N'' Roll)' name,  199 duration UNION ALL
            SELECT 'Run for Your Life' name,  207 duration UNION ALL
            SELECT 'Sin After Sin' name,  202 duration UNION ALL
            SELECT 'Shoot ''Em Down' name,  232 duration UNION ALL
            SELECT 'Destroyer' name,  255 duration UNION ALL
            SELECT 'Under the Blade' name,  279 duration UNION ALL
            SELECT 'Tear It Loose' name,  187 duration UNION ALL
            SELECT 'I''ll Never Grow Up, Now!' name,  248 duration UNION ALL
            SELECT 'Day of the Rocker' name,  301 duration ) b
     WHERE a.album_name = 'Under The Blade';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Dj Intro' name,  5 duration UNION ALL
            SELECT 'Rock & Roll Savior' name,  291 duration UNION ALL
            SELECT 'Pay The Price' name,  258 duration UNION ALL
            SELECT 'Follow Me' name,  217 duration UNION ALL
            SELECT 'Under The Blade' name,  370 duration UNION ALL
            SELECT 'Dee Supervisor Story' name,  155 duration UNION ALL
            SELECT 'Instrumental' name,  101 duration UNION ALL
            SELECT 'Cant Stand Still' name,  246 duration UNION ALL
            SELECT 'Ladies Boy' name,  423 duration UNION ALL
            SELECT 'Working On You Baby' name,  266 duration UNION ALL
            SELECT 'Come Back' name,  554 duration UNION ALL
            SELECT 'Great Balls Of Fire' name,  174 duration UNION ALL
            SELECT 'Without You' name,  174 duration UNION ALL
            SELECT 'Chinese Hustle' name,  139 duration UNION ALL
            SELECT 'Ill Never Grow Up, Now' name,  1018 duration ) b
     WHERE a.album_name = 'Train Kept A Rollin''';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'What You Don''t Know (Sure Can Hurt You)' name,  301 duration UNION ALL
            SELECT 'Sin After Sin' name,  188 duration UNION ALL
            SELECT 'Bad Boys (Of Rock ''N'' Roll)' name,  222 duration UNION ALL
            SELECT 'Destroyer' name,  343 duration UNION ALL
            SELECT 'Leader of the Pack' name,  190 duration UNION ALL
            SELECT 'Tear It Loose' name,  183 duration UNION ALL
            SELECT 'Band Rap' name,  202 duration UNION ALL
            SELECT 'You Can''t Stop Rock ''N'' Roll' name,  255 duration UNION ALL
            SELECT 'Run for Your Life' name,  216 duration UNION ALL
            SELECT 'Shoot ''Em Down' name,  212 duration UNION ALL
            SELECT 'Dee''s Rap' name,  276 duration UNION ALL
            SELECT 'It''s Only Rock ''N'' Roll (But I Like It)' name,  571 duration UNION ALL
            SELECT 'Band Introductions' name,  348 duration UNION ALL
            SELECT 'I Am (I''m Me)' name,  193 duration UNION ALL
            SELECT 'Under the Blade' name,  287 duration UNION ALL
            SELECT 'Let the Good Times Roll' name,  379 duration ) b
     WHERE a.album_name = 'Live at the Marquee Club';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'We''re Not Gonna Take It' name,  217 duration UNION ALL
            SELECT 'I Wanna Rock' name,  207 duration ) b
     WHERE a.album_name = 'Official Singles';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'We''re Not Gonna Take It' name,  219 duration UNION ALL
            SELECT 'I Wanna Rock' name,  179 duration UNION ALL
            SELECT 'Stay Hungry' name,  183 duration UNION ALL
            SELECT 'Leader of the Pack' name,  225 duration UNION ALL
            SELECT 'Come Out and Play' name,  294 duration ) b
     WHERE a.album_name = 'Rhino Hi-Five: Twisted Sister';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Have Yourself a Merry Little Christmas' name,  288 duration UNION ALL
            SELECT 'Oh Come All Ye Faithful' name,  279 duration UNION ALL
            SELECT 'White Christmas' name,  236 duration UNION ALL
            SELECT 'I''ll Be Home for Christmas' name,  248 duration UNION ALL
            SELECT 'Silver Bells' name,  305 duration UNION ALL
            SELECT 'I Saw Mommy Kissing Santa Claus' name,  219 duration UNION ALL
            SELECT 'Let It Snow, Let It Snow, Let It Snow' name,  189 duration UNION ALL
            SELECT 'Deck the Halls' name,  172 duration UNION ALL
            SELECT 'The Christmas Song (Chestnuts Roasting on an Open Fire)' name,  220 duration UNION ALL
            SELECT 'Heavy Metal Christmas (The Twelve Days of Christmas)' name,  314 duration UNION ALL
            SELECT 'We Wish You a Twisted Christmas' name,  36 duration ) b
     WHERE a.album_name = 'A Twisted Christmas';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Stay Hungry' name,  194 duration UNION ALL
            SELECT 'We''re Not Gonna Take It' name,  276 duration UNION ALL
            SELECT 'Burn in Hell' name,  337 duration UNION ALL
            SELECT 'Horror-Teria (The Beginning): A) Captain Howdy B) Street Justice' name,  522 duration UNION ALL
            SELECT 'I Wanna Rock' name,  195 duration UNION ALL
            SELECT 'The Price' name,  248 duration UNION ALL
            SELECT 'Don''t Let Me Down' name,  285 duration UNION ALL
            SELECT 'The Beast' name,  205 duration UNION ALL
            SELECT 'S.M.F.' name,  208 duration UNION ALL
            SELECT 'Never Say Never' name,  139 duration UNION ALL
            SELECT 'Blastin'' Fast & Loud' name,  180 duration UNION ALL
            SELECT 'Come Back' name,  385 duration UNION ALL
            SELECT 'Plastic Money' name,  245 duration UNION ALL
            SELECT 'You Know I Cry' name,  261 duration UNION ALL
            SELECT 'Rock ''N'' Roll Saviours' name,  304 duration UNION ALL
            SELECT 'Heroes Are Hard to Find' name,  300 duration ) b
     WHERE a.album_name = 'Still Hungry';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'We''re Not Gonna Take It' name,  219 duration UNION ALL
            SELECT 'I Wanna Rock' name,  179 duration UNION ALL
            SELECT 'Leader of the Pack' name,  225 duration UNION ALL
            SELECT 'You Can''t Stop Rock ''N'' Roll' name,  282 duration UNION ALL
            SELECT 'Stay Hungry' name,  183 duration UNION ALL
            SELECT 'Under the Blade' name,  279 duration UNION ALL
            SELECT 'Come Out and Play' name,  294 duration UNION ALL
            SELECT 'Love Is for Suckers' name,  206 duration UNION ALL
            SELECT 'I Believe in Rock ''N'' Roll' name,  243 duration UNION ALL
            SELECT 'The Kids Are Back' name,  198 duration UNION ALL
            SELECT 'I''ll Never Grow Up, Now!' name,  248 duration UNION ALL
            SELECT 'Shoot ''Em Down' name,  231 duration ) b
     WHERE a.album_name = 'Twisted Sister: Essentials';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Never Say Never' name,  140 duration UNION ALL
            SELECT 'Blastin'' Fast & Loud' name,  181 duration UNION ALL
            SELECT 'Follow Me' name,  210 duration UNION ALL
            SELECT 'Under the Blade' name,  301 duration UNION ALL
            SELECT 'Lady''s Boy' name,  309 duration UNION ALL
            SELECT 'Come Back' name,  415 duration UNION ALL
            SELECT 'Can''t Stand Still' name,  289 duration UNION ALL
            SELECT 'Honey, Look Three Times' name,  252 duration UNION ALL
            SELECT 'You Know I Cry' name,  352 duration UNION ALL
            SELECT 'Without You' name,  147 duration UNION ALL
            SELECT 'Plastic Money' name,  249 duration UNION ALL
            SELECT 'Long Tall Sally' name,  144 duration UNION ALL
            SELECT 'Johnny B. Goode' name,  259 duration ) b
     WHERE a.album_name = 'Club Daze, Volume II: Live in the Bars';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Come Back' name,  392 duration UNION ALL
            SELECT 'Pay the Price' name,  270 duration UNION ALL
            SELECT 'Rock ''N'' Roll Saviours' name,  279 duration UNION ALL
            SELECT 'High Steppin''' name,  167 duration UNION ALL
            SELECT 'Big Gun' name,  244 duration UNION ALL
            SELECT 'T.V. Wife' name,  243 duration UNION ALL
            SELECT 'Can''t Stand Still' name,  238 duration UNION ALL
            SELECT 'Follow Me' name,  234 duration UNION ALL
            SELECT 'I''ll Never Grow Up, Now!' name,  253 duration UNION ALL
            SELECT 'Lady''s Boy' name,  262 duration UNION ALL
            SELECT 'Leader of the Pack' name,  236 duration UNION ALL
            SELECT 'Under the Blade' name,  271 duration UNION ALL
            SELECT 'Shoot ''Em Down' name,  223 duration ) b
     WHERE a.album_name = 'Club Daze, Volume 1: The Studio Sessions';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'What You Don''t Know (Sure Can Hurt You)' name,  282 duration UNION ALL
            SELECT 'The Kids Are Back' name,  169 duration UNION ALL
            SELECT 'Stay Hungry' name,  308 duration UNION ALL
            SELECT 'Destroyer' name,  249 duration UNION ALL
            SELECT 'We''re Not Gonna Take It' name,  197 duration UNION ALL
            SELECT 'You Can''t Stop Rock ''N'' Roll' name,  442 duration UNION ALL
            SELECT 'Knife in the Back' name,  166 duration UNION ALL
            SELECT 'Shoot ''Em Down' name,  198 duration UNION ALL
            SELECT 'Under the Blade' name,  270 duration ) b
     WHERE a.album_name = 'Live at Hammersmith';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'We''re Not Gonna Take It' name,  219 duration UNION ALL
            SELECT 'I Wanna Rock' name,  179 duration UNION ALL
            SELECT 'I Am (I''m Me)' name,  215 duration UNION ALL
            SELECT 'The Price' name,  229 duration UNION ALL
            SELECT 'You Can''t Stop Rock ''N'' Roll' name,  282 duration UNION ALL
            SELECT 'The Kids Are Back' name,  198 duration UNION ALL
            SELECT 'Shoot ''Em Down' name,  231 duration UNION ALL
            SELECT 'Under the Blade' name,  279 duration UNION ALL
            SELECT 'I''ll Never Grow Up, Now!' name,  248 duration UNION ALL
            SELECT 'Bad Boys (Of Rock ''N'' Roll)' name,  199 duration UNION ALL
            SELECT 'What You Don''t Know (Sure Can Hurt You)' name,  308 duration UNION ALL
            SELECT 'Destroyer' name,  278 duration UNION ALL
            SELECT 'Tear It Loose' name,  187 duration UNION ALL
            SELECT 'Run for Your Life' name,  218 duration UNION ALL
            SELECT 'It''s Only Rock ''N'' Roll (But I Like It)' name,  612 duration UNION ALL
            SELECT 'Let the Good Times Roll / Feel so Fine' name,  255 duration ) b
     WHERE a.album_name = 'Big Hits and Nasty Cuts';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Wake Up (The Sleeping Giant)' name,  260 duration UNION ALL
            SELECT 'Hot Love' name,  213 duration UNION ALL
            SELECT 'Love Is for Suckers' name,  206 duration UNION ALL
            SELECT 'I''m so Hot for You' name,  246 duration UNION ALL
            SELECT 'Tonight' name,  232 duration UNION ALL
            SELECT 'Me and the Boys' name,  232 duration UNION ALL
            SELECT 'One Bad Habit' name,  197 duration UNION ALL
            SELECT 'I Want This Night (To Last Forever)' name,  259 duration UNION ALL
            SELECT 'You Are All That I Need' name,  257 duration UNION ALL
            SELECT 'Yeah Right!' name,  193 duration ) b
     WHERE a.album_name = 'Love Is for Suckers';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Come Out and Play' name,  294 duration UNION ALL
            SELECT 'Leader of the Pack' name,  225 duration UNION ALL
            SELECT 'You Want What We Got' name,  224 duration UNION ALL
            SELECT 'I Believe in Rock ''N'' Roll' name,  243 duration UNION ALL
            SELECT 'The Fire Still Burns' name,  213 duration UNION ALL
            SELECT 'Be Chrool to Your Scuel' name,  234 duration UNION ALL
            SELECT 'I Believe in You' name,  323 duration UNION ALL
            SELECT 'Out on the Streets' name,  268 duration UNION ALL
            SELECT 'Lookin'' Out for #1' name,  187 duration UNION ALL
            SELECT 'Kill or Be Killed' name,  166 duration UNION ALL
            SELECT 'King of the Fools' name,  387 duration ) b
     WHERE a.album_name = 'Come Out and Play';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'Stay Hungry' name,  183 duration UNION ALL
            SELECT 'We''re Not Gonna Take It' name,  219 duration UNION ALL
            SELECT 'Burn in Hell' name,  283 duration UNION ALL
            SELECT 'Horror-Teria (The Beginning): A) Captain Howdy B) Street Justice' name,  463 duration UNION ALL
            SELECT 'I Wanna Rock' name,  179 duration UNION ALL
            SELECT 'The Price' name,  229 duration UNION ALL
            SELECT 'Don''t Let Me Down' name,  267 duration UNION ALL
            SELECT 'The Beast' name,  209 duration UNION ALL
            SELECT 'S.M.F.' name,  180 duration ) b
     WHERE a.album_name = 'Stay Hungry';


INSERT INTO song(song_name, song_duration_seconds, song_album)
    SELECT b.name,
           b.duration,
           a.ID
      FROM album a
           CROSS JOIN (
            SELECT 'The Kids Are Back' name,  196 duration UNION ALL
            SELECT 'Like a Knife in the Back' name,  184 duration UNION ALL
            SELECT 'Ride to Live, Live to Ride' name,  244 duration UNION ALL
            SELECT 'I Am (I''m Me)' name,  215 duration UNION ALL
            SELECT 'The Power and the Glory' name,  263 duration UNION ALL
            SELECT 'We''re Gonna Make It' name,  224 duration UNION ALL
            SELECT 'I''ve Had Enough' name,  242 duration UNION ALL
            SELECT 'I''ll Take You Alive' name,  186 duration UNION ALL
            SELECT 'You''re Not Alone (Suzette''s Song)' name,  244 duration UNION ALL
            SELECT 'You Can''t Stop Rock ''N'' Roll' name,  283 duration UNION ALL
            SELECT 'One Man Woman' name,  191 duration UNION ALL
            SELECT 'Four Barrel Heart of Love' name,  184 duration UNION ALL
            SELECT 'Feel the Power' name,  194 duration ) b
     WHERE a.album_name = 'You Can''t Stop Rock ''N'' Roll';


INSERT INTO collection(collection_name, release_date) VALUES
     ('Me Rock', to_date('2022-10-07', 'yyyy-mm-dd')),
     ('Me Rock 2', to_date('2020-12-08', 'yyyy-mm-dd')),
     ('DEATH', to_date('2010-05-07', 'yyyy-mm-dd')),
     ('Верни мне 2008', to_date('2008-01-01', 'yyyy-mm-dd'));

INSERT INTO song_collection(collection, song)
        SELECT c.ID,
               s.ID
          FROM collection c
               CROSS JOIN song s
         WHERE s.song_name IN ('One Man Woman', 'The Power and the Glory', 'The Beast')
           AND c.collection_name = 'DEATH';