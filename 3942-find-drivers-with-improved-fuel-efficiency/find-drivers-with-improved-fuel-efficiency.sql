# Write your MySQL query statement below
SELECT d.driver_id, d.driver_name,
 ROUND(first_half_avg, 2) AS first_half_avg, ROUND(second_half_avg, 2) AS second_half_avg,
ROUND(second_half_avg - first_half_avg, 2) AS efficiency_improvement
FROM (
    SELECT driver_id,
        AVG(
            CASE 
                WHEN MONTH(trip_date) BETWEEN 1 AND 6
                THEN distance_km / fuel_consumed
            END
        ) AS first_half_avg,
        AVG(
            CASE 
                WHEN MONTH(trip_date) BETWEEN 7 AND 12
                THEN distance_km / fuel_consumed
            END
        ) AS second_half_avg
    FROM trips
    GROUP BY driver_id
) t
JOIN drivers d
ON d.driver_id = t.driver_id
WHERE first_half_avg IS NOT NULL AND second_half_avg IS NOT NULL 
AND second_half_avg > first_half_avg
ORDER BY efficiency_improvement DESC, d.driver_name ASC;
