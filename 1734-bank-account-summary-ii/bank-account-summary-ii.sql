# Write your MySQL query statement below
SELECT U.name, SUM(T.amount) AS balance
FROM Transactions T
JOIN Users U
ON T.account = U.account
GROUP BY U.name
HAVING balance > 10000