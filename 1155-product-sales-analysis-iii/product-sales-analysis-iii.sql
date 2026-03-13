# Write your MySQL query statement below
WITH first AS(
    SELECT *, 
    DENSE_RANK() OVER(PARTITION BY product_id ORDER BY year) AS rnk
    FROM Sales
)

SELECT product_id, year AS first_year, quantity, price
FROM first 
WHERE rnk = 1