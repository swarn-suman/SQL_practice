# Write your MySQL query statement below

#SELECT score, DENSE_RANK() OVER (ORDER BY score DESC) AS `rank`
#FROM Scores;

SELECT s1.score, (SELECT COUNT(DISTINCT s2.score) FROM Scores AS s2 WHERE s2.score > s1.score) + 1
AS `rank`
FROM Scores AS s1
ORDER BY s1.score DESC;
