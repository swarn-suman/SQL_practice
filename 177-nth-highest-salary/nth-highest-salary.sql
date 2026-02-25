CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      SELECT MAX(salary) AS `getNthHighestSalary(N)`
      FROM(
        SELECT salary,
        DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
        FROM Employee
      )t
      WHERE t.rnk = N
  );
END