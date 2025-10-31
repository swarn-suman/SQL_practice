# Write your MySQL query statement below
(
    SELECT 
    U.name AS results
    FROM MovieRating R
    JOIN Users U ON R.user_id = U.user_id
    GROUP BY U.name
    ORDER BY COUNT(*) DESC, U.name ASC
    LIMIT 1
)
UNION ALL
(
    SELECT 
    M.title AS results
    FROM MovieRating R
    JOIN Movies M ON R.movie_id = M.movie_id
    WHERE R.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY M.title
    ORDER BY AVG(R.rating) DESC, M.title ASC
    LIMIT 1
);
