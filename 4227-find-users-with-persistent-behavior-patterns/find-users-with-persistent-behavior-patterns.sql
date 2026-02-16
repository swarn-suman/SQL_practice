# Write your MySQL query statement below

    SELECT user_id, action, COUNT(action_date) AS streak_length,
    MIN(action_date) AS start_date, MAX(action_date) AS end_date
    FROM activity
    GROUP BY user_id, action
    HAVING streak_length >= 5
    ORDER BY streak_length DESC, user_id ASC
