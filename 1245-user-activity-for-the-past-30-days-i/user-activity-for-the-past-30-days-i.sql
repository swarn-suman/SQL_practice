# Write your MySQL query statement below
SELECT activity_date AS `day`, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_type IN ('open_session', 'end_session', 'scroll_down','send_message')
AND activity_date BETWEEN DATE_ADD('2019-07-27',INTERVAL -29 DAY) AND '2019-07-27'
GROUP BY activity_date
