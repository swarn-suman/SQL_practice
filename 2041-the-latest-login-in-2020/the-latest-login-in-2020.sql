# Write your MySQL query statement below
WITH temp AS(
    SELECT *, 
    DENSE_RANK() OVER(PARTITION BY user_id ORDER BY time_stamp DESC) AS rnk
    FROM Logins
    WHERE YEAR(time_stamp) = '2020'
)

SELECT user_id, time_stamp AS last_stamp
FROM temp 
WHERE rnk = 1