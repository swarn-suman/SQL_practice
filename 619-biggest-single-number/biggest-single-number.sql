# Write your MySQL query statement below
SELECT MAX(num) AS num
FROM (
    SELECT num 
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
    ORDER BY num DESC
    LIMIT 1)t