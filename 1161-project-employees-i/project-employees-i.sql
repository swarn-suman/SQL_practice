# Write your MySQL query statement below
SELECT DISTINCT project_id,
    ROUND(AVG(E.experience_years) OVER(PARTITION BY P.project_id),2) AS average_years
    FROM Project P
    JOIN Employee E
    ON P. employee_id = E.employee_id
