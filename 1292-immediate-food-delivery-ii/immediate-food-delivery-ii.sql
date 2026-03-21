# Write your MySQL query statement below
WITH temp1 AS(
    SELECT *,
    ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS rnk
    FROM Delivery
)

    SELECT ROUND(COUNT(*) * 100.0 / (SELECT COUNT(DISTINCT customer_id) FROM Delivery),2) AS immediate_percentage
    FROM temp1 
    WHERE rnk = 1
    AND order_date = customer_pref_delivery_date
