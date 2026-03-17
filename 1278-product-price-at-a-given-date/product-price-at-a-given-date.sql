# Write your MySQL query statement below
WITH ranked AS (
    SELECT product_id, new_price, change_date,
        DENSE_RANK() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS rn
    FROM Products
    WHERE change_date <= '2019-08-16'
)

SELECT P.product_id, COALESCE(R.new_price, 10) AS price
FROM (SELECT DISTINCT product_id FROM Products) P
LEFT JOIN ranked R
ON P.product_id = R.product_id AND R.rn = 1;
