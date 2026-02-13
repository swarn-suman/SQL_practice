# Write your MySQL query statement below
WITH temp AS (
SELECT user_id,
SUM(CASE WHEN activity_type = "free_trial" THEN 1 ELSE 0 END) AS free_trial_count,
SUM(CASE WHEN activity_type = "paid" THEN 1 ELSE 0 END) AS paid_count,
SUM(CASE WHEN activity_type = "free_trial" THEN  activity_duration ELSE 0 END) AS trial_duration,
SUM(CASE WHEN activity_type = "paid"  THEN  activity_duration ELSE 0 END) AS paid_duration
FROM UserActivity
GROUP BY user_id
)

SELECT user_id,
ROUND(trial_duration/ free_trial_count,2) AS trial_avg_duration,
ROUND(paid_duration/ paid_count,2) AS paid_avg_duration
FROM temp
WHERE paid_count != 0
