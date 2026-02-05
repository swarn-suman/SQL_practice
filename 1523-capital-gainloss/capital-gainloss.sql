# Write your MySQL query statement below
SELECT DISTINCT stock_name,
SUM(CASE 
      WHEN operation = 'Sell' THEN price 
      WHEN operation = 'Buy' THEN -price 
    END) OVER (PARTITION BY stock_name) as capital_gain_loss
FROM Stocks;
