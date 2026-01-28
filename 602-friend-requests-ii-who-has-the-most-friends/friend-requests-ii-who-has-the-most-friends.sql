# Write your MySQL query statement below
SELECT id, SUM(num) AS num
FROM (
SELECT requester_id AS id, COUNT(*) AS num
FROM RequestAccepted
GROUP BY requester_id
UNION ALL
SELECT accepter_id, COUNT(*)
FROM RequestAccepted
GROUP BY accepter_id
) t
GROUP BY id
ORDER BY num DESC
LIMIT 1;