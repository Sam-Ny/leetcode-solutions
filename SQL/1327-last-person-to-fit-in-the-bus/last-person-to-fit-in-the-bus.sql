/* Write your PL/SQL query statement below */


-- SELECT person_name
-- FROM (
--   SELECT person_id, person_name, weight, turn, total_weight_after_each_turn
--   FROM (
--     SELECT
--       person_id,
--       person_name,
--       weight,
--       turn,
--       SUM(weight) OVER (
--         ORDER BY turn
--         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
--       ) AS total_weight_after_each_turn
--     FROM queue
--   ) v1
--   WHERE v1.total_weight_after_each_turn <= 1000
--   ORDER BY total_weight_after_each_turn DESC
-- ) v2
-- WHERE ROWNUM = 1;



  SELECT person_name
  FROM (
    SELECT
      person_id,
      person_name,
      weight,
      turn,
      SUM(weight) OVER (
        ORDER BY turn
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
      ) AS total_weight_after_each_turn
    FROM queue
    ORDER BY total_weight_after_each_turn DESC
  ) v1
  WHERE v1.total_weight_after_each_turn <= 1000 and 
  rownum = 1;


