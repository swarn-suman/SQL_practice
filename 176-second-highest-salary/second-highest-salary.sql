# Write your MySQL query statement below
SELECT MAX(salary) AS SecondHighestSalary
FROM (
    SELECT salary,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS position
    FROM Employee
)t
WHERE position = 2;