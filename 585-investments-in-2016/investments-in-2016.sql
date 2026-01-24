SELECT 
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM (
    SELECT 
        tiv_2016,
        COUNT(*) OVER (PARTITION BY tiv_2015) AS same_tiv_2015_cnt,
        COUNT(*) OVER (PARTITION BY lat, lon) AS same_location_cnt
    FROM Insurance
) t
WHERE same_tiv_2015_cnt > 1
  AND same_location_cnt = 1;
