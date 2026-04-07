# Write your MySQL query statement below
WITH temp AS(
    SELECT user_id, COUNT(*) AS cnt, 
    SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END) AS confirmed_cnt
    FROM Confirmations
    GROUP BY user_id
)

SELECT S.user_id, COALESCE(ROUND(T.confirmed_cnt/T.cnt,2),0) AS confirmation_rate
FROM Signups S
LEFT JOIN temp T
ON S.user_id = T.user_id
