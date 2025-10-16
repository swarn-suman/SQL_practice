# Write your MySQL query statement below
SELECT S.student_id, S.student_name, B.subject_name, COALESCE(COUNT(E.subject_name), 0) AS attended_exams
FROM Students S
CROSS JOIN Subjects B
LEFT JOIN Examinations E
ON E.student_id = S.student_id
AND E.subject_name = B.subject_name
GROUP BY S.student_id, S.student_name, B.subject_name
ORDER BY S.student_id, B.subject_name;
