SELECT genre_name, COUNT(*) FROM genre 
JOIN genresinger ON genresinger.gen_id = genre.genre_id 
GROUP BY genre.genre_name
ORDER BY COUNT(*) DESC;

SELECT COUNT(*) FROM track 
JOIN album ON track.album_id = album.album_id 
WHERE album.release_year BETWEEN '2019' AND '2020';

SELECT album_id,AVG(duration_time) FROM track 
GROUP BY album_id 
ORDER BY AVG(duration_time);

SELECT singer_name FROM singer
WHERE singer_name NOT IN (SELECT singer_name FROM singer 
JOIN singeralbum  ON singeralbum.s_id  = singer.singer_id
JOIN album ON singeralbum.alb_id = album.album_id
WHERE album.release_year = '2020');

SELECT compilation_name FROM compilation
JOIN comptrack ON comptrack.compil_id = compilation.compilation_id 
JOIN track ON comptrack.tr_id = track.track_id 
JOIN album ON track.album_id = album.album_id 
JOIN singeralbum ON singeralbum.alb_id = album.album_id 
JOIN singer ON singeralbum.s_id = singer.singer_id 
WHERE singer.singer_name = 'Metallica';

SELECT album_name FROM album 
JOIN singeralbum ON singeralbum.alb_id = album.album_id 
JOIN singer ON singeralbum.s_id = singer.singer_id 
JOIN genresinger ON genresinger.sing_id = singer.singer_id 
GROUP BY album.album_name, genresinger.sing_id
HAVING COUNT(genresinger.sing_id) >1;

SELECT track_name FROM track 
FULL JOIN comptrack ON comptrack.tr_id = track.track_id 
FULL JOIN compilation ON comptrack.compil_id = compilation.compilation_id 
WHERE comptrack.comptrack_id IS NULL;

SELECT singer_name FROM singer 
JOIN singeralbum ON singeralbum.s_id = singer.singer_id 
JOIN album ON singeralbum.alb_id = album.album_id 
JOIN track ON track.album_id = album.album_id 
WHERE track.duration_time = (SELECT MIN(duration_time) FROM track);

SELECT album_name FROM album 
JOIN track ON track.album_id = album.album_id 
GROUP BY album.album_id
HAVING COUNT(track.track_id) = 
    (SELECT COUNT(track.track_id) FROM track
    GROUP BY track.album_id 
    ORDER BY 1
    LIMIT 1);