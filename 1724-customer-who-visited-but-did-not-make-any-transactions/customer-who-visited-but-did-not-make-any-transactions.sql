# Write your MySQL query statement below
WITH temp AS(
SELECT V.visit_id, V.customer_id
FROM Visits V
LEFT JOIN Transactions T
ON V.visit_id = T.visit_id
WHERE T.transaction_id IS NULL
)

SELECT customer_id, COUNT(*) AS count_no_trans
FROM temp
GROUP BY customer_id


