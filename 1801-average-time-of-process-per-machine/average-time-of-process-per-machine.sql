# Write your MySQL query statement below
WITH temp AS(
    SELECT machine_id, process_id,
    CASE WHEN activity_type = 'end' THEN timestamp
    ELSE -timestamp END AS timestamp
    FROM Activity
),

temp1 AS (
    SELECT machine_id, SUM(timestamp) AS total_time
    FROM temp
    GROUP BY machine_id
),

temp2 AS(
    SELECT machine_id, COUNT(DISTINCT process_id) AS cnt
    FROM Activity
    GROUP BY machine_id
)

SELECT temp1.machine_id, ROUND(temp1.total_time / temp2.cnt, 3) AS processing_time
FROM temp1
JOIN temp2
ON temp1.machine_id = temp2.machine_id;