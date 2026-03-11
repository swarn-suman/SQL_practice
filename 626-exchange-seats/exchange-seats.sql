WITH temp AS(
    SELECT S1.id AS id1, S1.student AS student, S2.id AS id2
    FROM Seat S1
    LEFT JOIN Seat S2
    ON S2.id = S1.id + 1
)

SELECT CASE
WHEN id1 % 2 = 1 AND id1 NOT IN(SELECT MAX(id) FROM Seat) THEN id2
WHEN id1 % 2 = 1 AND id1 IN(SELECT MAX(id) FROM Seat) THEN id1
ELSE id1 - 1 END AS id,
student FROM temp
ORDER BY id

