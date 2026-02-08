# Write your MySQL query statement below
SELECT user_id, COALESCE(rate,0) confirmation_rate
FROM (
SELECT S.user_id, 
ROUND(SUM(CASE 
	   WHEN C.action = "confirmed" THEN 1 
       ELSE 0 END) / COUNT(C.action),2) AS rate
FROM Signups S
LEFT JOIN Confirmations C
ON S.user_id = C.user_id
GROUP BY S.user_id)t;