# Write your MySQL query statement below
WITH ranked AS (
    SELECT
        user_id,
        reaction,
        COUNT(*) AS reaction_count,
        SUM(COUNT(*)) OVER (PARTITION BY user_id) AS total_reactions,
        RANK() OVER (
            PARTITION BY user_id 
            ORDER BY COUNT(*) DESC
        ) AS rnk
    FROM reactions
    GROUP BY user_id, reaction
)
SELECT
    user_id,
    reaction AS dominant_reaction,
    ROUND(reaction_count / total_reactions, 2) AS reaction_ratio
FROM ranked
WHERE rnk = 1
  AND total_reactions >= 5
  AND reaction_count / total_reactions >= 0.60
ORDER BY reaction_ratio DESC, user_id ASC;
