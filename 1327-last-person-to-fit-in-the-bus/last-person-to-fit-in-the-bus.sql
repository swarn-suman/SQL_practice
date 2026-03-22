# Write your MySQL query statement below
WITH temp AS(
    SELECT *,
    SUM(weight) OVER(ORDER BY turn) AS total_wt
    FROM Queue
)

SELECT person_name
FROM temp 
WHERE total_wt <= 1000
ORDER BY total_wt DESC
LIMIT 1
