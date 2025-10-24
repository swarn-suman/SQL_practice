SELECT ROUND(
  (SELECT COUNT(DISTINCT a.player_id) * 1.0
   FROM Activity a
   JOIN (
     SELECT player_id, MIN(event_date) AS first_login
     FROM Activity
     GROUP BY player_id
   ) f
     ON a.player_id = f.player_id
    AND a.event_date = DATE_ADD(f.first_login, INTERVAL 1 DAY)
  )
  /
  (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction;
