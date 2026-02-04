SELECT DISTINCT request_at AS Day, ROUND(cancelled_cnt / total_cnt, 2) AS `Cancellation Rate`
FROM (
    SELECT
        T.request_at,
        COUNT(*) OVER (PARTITION BY T.request_at) AS total_cnt,
        SUM(
            CASE
                WHEN T.status IN ('cancelled_by_client', 'cancelled_by_driver') THEN 1
                ELSE 0
            END
        ) OVER (PARTITION BY T.request_at) AS cancelled_cnt
    FROM Trips T
    JOIN Users C
        ON T.client_id = C.users_id
        AND C.banned = 'No'
        AND C.role = 'client'
    JOIN Users D
        ON T.driver_id = D.users_id
        AND D.banned = 'No'
        AND D.role = 'driver'
    WHERE T.request_at BETWEEN '2013-10-01' AND '2013-10-03'
) temp;
