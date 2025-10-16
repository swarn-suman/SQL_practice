# Write your MySQL query statement below
SELECT a.name  as Employee
FROM
Employee as a 
JOIN 
Employee as b
ON a.managerId = b.id
WHERE
a.salary > b.salary;