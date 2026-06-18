
--===========================================SPOTIFY DATA ANALYSIS================================================--
drop table if exists spotify

-- creating table

create table spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);

select * from spotify

------------------------------------------------EXPLORATORY DATA ANALYSIS(EDA)-------------------------------------------------

select count(*) from spotify

select count(distinct artist) from spotify

select distinct album_type from spotify

select max(duration_min) from spotify

select min(duration_min) from spotify

select * from spotify
where duration_min=0

delete from spotify 
where duration_min=0

select count(distinct channel) from spotify

select distinct channel from spotify

select count(*) from spotify
where most_played_on='Youtube'

select max(views) from spotify

select  * from spotify
where views=0

select max(likes) from spotify

select max(comments) from spotify

select count(*) from spotify
where licensed='true'

select count(*) from spotify
where licensed='false'

-----------------------------------------BASIC BUSINESS PROBLEMS---------------------------------------------

--1.Retrieve the names of all tracks that have more than 1 billion streams.
select track from spotify
where stream>1000000000

--2.List all albums along with their respective artists.
select distinct album,artist from spotify
order by album

--3.Get the total number of comments for tracks where licensed='true'.
select sum(comments) as total_comments from spotify
where licensed='true'

--4.Find all tracks that belong to the albumtype single.
select track from spotify
where album_type='single'

--5.Count the total no of tracks by each artist.
select artist,count(*) as no_of_tracks from spotify
group by 1
order by 2

------------------------------------------MEDIUM LEVEL BUSINESS PROBLEMS--------------------------------------------

--6.Calculate the average danceability of tracks in each album.
select album,round(avg(danceability)::numeric,2) as average_danceability from spotify
group by 1
order by 2 desc

--7.Find the top 5 tracks with the highest energy values.
select distinct track,energy from spotify
group by 1,2
order by 2 desc limit 5

--8.List all tracks along with their views and likes where official_video = TRUE.
select distinct track,sum(views)as total_views,sum(likes) as total_likes from spotify
where official_video='true'
group by 1
order by 2 desc

--9.For each album, calculate the total views of all associated tracks.
select distinct album,track,sum(views) as total_views from spotify
group by 1,2
order by 3 desc 

--10.Retrieve the track names that have been streamed on Spotify more than YouTube.
select * from 
(select track,
            coalesce(sum(case when most_played_on='Spotify' then stream end),0) as streamed_on_spotify ,
			coalesce(sum(case when most_played_on='Youtube' then stream end),0) as streamed_on_youtube
from spotify
group by 1) as t1
where 
    streamed_on_spotify>streamed_on_youtube
	and
	streamed_on_youtube!=0

----------------------------------------ADVANCED LEVEL BUSINESS PROBLEMS----------------------------------------------

--11.Find the top 3 most-viewed tracks for each artist using window functions.

--each artists and total view for each track
--track with highest view for each artist (we need top)
--dense rank
--cte and filter rank<=3

with ranking_artist
as
(select artist,track,sum(views)as total_views,
       dense_rank() over(partition by artist order by sum(views)desc) as rank
from spotify
group by 1,2
order by 1,3 desc)
select * from ranking_artist
where rank<=3
where rank<=3
order by rank 

--12.Write a query to find tracks where the liveness score is above the average.

select track,artist,liveness
from spotify
where liveness>(select avg(liveness) from spotify)

--13.Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.

with cte
as (
select album,
       max(energy) as highest_energy,
	   min(energy) as lowest_energy
from spotify
group by 1)
select 
      album,
	  highest_energy-lowest_energy as energy_diff
from cte
order by 2 desc

