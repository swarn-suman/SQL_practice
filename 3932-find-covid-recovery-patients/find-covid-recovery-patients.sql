# Write your MySQL query statement below
WITH ranked_tests AS (
    SELECT patient_id, test_date, result,
        MIN(CASE WHEN result = 'Positive' THEN test_date END)
            OVER (PARTITION BY patient_id) AS first_positive_date
    FROM covid_tests
),
recovery AS (
    SELECT patient_id, MIN(test_date) AS first_negative_date, first_positive_date
    FROM ranked_tests
    WHERE result = 'Negative' AND test_date > first_positive_date
    GROUP BY patient_id, first_positive_date
)
SELECT
    p.patient_id,
    p.patient_name,
    p.age,
    DATEDIFF(r.first_negative_date, r.first_positive_date) AS recovery_time
FROM recovery r
JOIN patients p
    ON p.patient_id = r.patient_id
ORDER BY recovery_time ASC, patient_name ASC;
