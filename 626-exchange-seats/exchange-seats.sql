# Write your MySQL query statement below
SELECT CASE
        WHEN id % 2 = 1 THEN LEAD(id, 1, id) OVER (ORDER BY id)
        ELSE LAG(id) OVER (ORDER BY id)
END AS id, 
student FROM Seat
ORDER BY id;

