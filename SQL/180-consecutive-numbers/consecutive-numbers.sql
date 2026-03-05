/* Write your PL/SQL query statement below */


WITH w AS (
  SELECT
    id,
    num,
    -- mark boundaries where num changes
    CASE WHEN LAG(num) OVER (ORDER BY id) = num THEN 0 ELSE 1 END AS is_new_group
  FROM Logs
),
runs AS (
  -- running sum of boundaries gives a group id for each consecutive block
  SELECT
    id,
    num,
    SUM(is_new_group) OVER (ORDER BY id) AS group_id
  FROM w
)
SELECT DISTINCT num AS ConsecutiveNums
FROM runs
GROUP BY num, group_id
HAVING COUNT(*) >= 3;
