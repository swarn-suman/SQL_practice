# Write your MySQL query statement below
SELECT B.book_id, B.title, B.author, B.genre, B.pages, (R.highest_rating - R.lowest_rating) AS rating_spread,
    ROUND(R.extreme_ratings / R.total_sessions, 2) AS polarization_score
FROM books B
JOIN (
    SELECT 
        book_id,
        COUNT(*) AS total_sessions,
        SUM(CASE WHEN session_rating <= 2 OR session_rating >= 4 THEN 1 ELSE 0 END) AS extreme_ratings,
        MAX(session_rating) AS highest_rating,
        MIN(session_rating) AS lowest_rating
    FROM reading_sessions
    GROUP BY book_id
) R
    ON B.book_id = R.book_id
WHERE 
    R.total_sessions >= 5
    AND R.highest_rating >= 4
    AND R.lowest_rating <= 2
    AND (R.extreme_ratings * 1.0 / R.total_sessions) >= 0.6
ORDER BY 
    polarization_score DESC,
    B.title DESC;
