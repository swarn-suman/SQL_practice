# Write your MySQL query statement below
WITH temp AS(
    SELECT stock_name,
    CASE WHEN operation = 'Buy' THEN -price 
    ELSE price END AS price
    FROM Stocks
)

SELECT stock_name,
SUM(price) AS capital_gain_loss
FROM temp
GROUP BY stock_name


  
