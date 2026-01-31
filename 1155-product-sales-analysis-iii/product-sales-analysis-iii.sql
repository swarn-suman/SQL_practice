# Write your MySQL query statement below
SELECT product_id, year AS first_year, quantity, price
FROM(
    SELECT product_id, year, quantity, price,
    DENSE_RANK() OVER(PARTITION BY product_id ORDER BY year) AS position
    FROM Sales
)t
WHERE position = 1;
