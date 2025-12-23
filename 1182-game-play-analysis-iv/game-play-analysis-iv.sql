
SELECT ROUND(
  (
    SELECT COUNT(*)
    FROM (
      SELECT player_id, MIN(event_date) AS first_day
      FROM Activity
      GROUP BY player_id
    ) f
    WHERE EXISTS (
      SELECT 1
      FROM Activity a2
      WHERE a2.player_id = f.player_id
        AND a2.event_date = f.first_day + 1
    )
  )
  /
  (
    SELECT COUNT(DISTINCT player_id)
    FROM Activity
  ),
  2
) AS fraction
FROM dual;
