# Write your MySQL query statement below
WITH temp AS(
    SELECT product_id, order_date, SUM(unit) AS unit
    FROM Orders
    WHERE YEAR(order_date) = '2020' AND MONTH(order_date) = '02'
    GROUP BY product_id 
)

SELECT P.product_name, t.unit
FROM Products P
JOIN temp t
ON P.product_id = t.product_id 
WHERE t.unit >= 100
