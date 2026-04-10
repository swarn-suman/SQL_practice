# Write your MySQL query statement below
WITH temp AS(
    SELECT *,
    FIRST_VALUE(score) OVER (PARTITION BY student_id, subject ORDER BY exam_date) AS first_score,
    FIRST_VALUE(score) OVER (PARTITION BY student_id, subject ORDER BY exam_date DESC) AS latest_score,
    COUNT(*) OVER (PARTITION BY student_id, subject) AS exam_count
    FROM Scores
)


SELECT DISTINCT student_id, subject, first_score, latest_score
FROM temp 
WHERE latest_score > first_score AND exam_count >= 2
ORDER BY student_id, subject
