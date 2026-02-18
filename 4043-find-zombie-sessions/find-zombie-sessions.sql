# Write your MySQL query statement below
WITH temp AS(
    SELECT session_id, user_id,
    TIMESTAMPDIFF(MINUTE, MIN(event_timestamp), MAX(event_timestamp)) AS session_duration_minutes,
           SUM(CASE WHEN event_type='scroll' THEN 1 ELSE 0 END) AS scroll_count,
           SUM(CASE WHEN event_type='click' THEN 1 ELSE 0 END) AS click_count,
           SUM(CASE WHEN event_type='purchase' THEN 1 ELSE 0 END) AS purchase_count
    FROM app_events
    GROUP BY user_id, session_id
    HAVING TIMESTAMPDIFF(MINUTE, MIN(event_timestamp), MAX(event_timestamp))>30 
    AND scroll_count >=5 
    AND click_count < 0.20*scroll_count 
    AND purchase_count = 0
)

SELECT session_id, user_id,
       session_duration_minutes,
       scroll_count
FROM temp
ORDER BY scroll_count DESC, session_id ASC
       