# Write your MySQL query statement below
WITH temp AS(
SELECT employee_id, department_id, primary_flag,
COUNT(*) OVER(PARTITION BY employee_id) AS cnt
FROM Employee
)

SELECT employee_id, department_id
FROM temp
WHERE cnt = 1 OR primary_flag = 'Y'
