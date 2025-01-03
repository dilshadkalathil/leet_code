WITH UserMovieCount AS (
    SELECT ur.user_id, 
           u.name AS user_name,
           COUNT(DISTINCT ur.movie_id) AS movie_count
    FROM MovieRating ur
    JOIN Users u ON ur.user_id = u.user_id
    GROUP BY ur.user_id
),
TopUser AS (
    SELECT user_name
    FROM UserMovieCount
    ORDER BY movie_count DESC, user_name ASC
    LIMIT 1
),
MovieAvgRating AS (
    SELECT mr.movie_id,
           m.title AS movie_title,
           AVG(mr.rating) AS avg_rating
    FROM MovieRating mr
    JOIN Movies m ON mr.movie_id = m.movie_id
    WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY mr.movie_id, m.title
),
TopMovie AS (
    SELECT movie_title
    FROM MovieAvgRating
    ORDER BY avg_rating DESC, movie_title ASC
    LIMIT 1
)
SELECT (SELECT user_name FROM TopUser) AS results
UNION ALL
SELECT (SELECT movie_title FROM TopMovie) AS results;

   