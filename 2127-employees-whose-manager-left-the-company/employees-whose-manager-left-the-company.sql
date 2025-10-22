# Write your MySQL query statement below
SELECT M.employee_id
FROM Employees M
LEFT JOIN Employees E
ON E.employee_id = M.manager_id 
WHERE M.salary < 30000 AND E.employee_id IS NULL AND M.manager_id IS NOT NULL
ORDER BY M.employee_id;