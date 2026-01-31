# Write your MySQL query statement below
SELECT t.name AS Department, t.employee_name AS Employee, t.salary
FROM(
    SELECT  D.name AS name, E.name AS employee_name, E.salary,
    DENSE_RANK() OVER(PARTITION BY D.name ORDER BY E.salary DESC) AS position
    FROM Employee E
    JOIN Department D
    ON E.departmentId = D.id
)t
WHERE position <=3