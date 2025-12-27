/* Write your PL/SQL query statement below */
-- select requester_id,
-- accepter_id,
-- count(*) over (partition by requester_id)
-- +
-- sum(case
-- when requester_id = accepter_id then 1
-- Else 0
-- END) over () as total_requests
-- from 
-- RequestAccepted
-- order by requester_id, accepter_id;



-- WITH counts AS (
--   SELECT val, COUNT(*) AS total_count
--   FROM (
--     SELECT requester_id AS val FROM RequestAccepted
--     UNION ALL
--     SELECT accepter_id          FROM RequestAccepted
--   )
--   GROUP BY val
-- ),
-- draft AS (
--   SELECT DISTINCT
--          r.requester_id,
--          c.total_count AS total_requests
--   FROM RequestAccepted r
--   JOIN counts c
--     ON c.val = r.requester_id
-- )
-- SELECT
--   d.requester_id as id,
--   d.total_requests as num
-- FROM draft d
-- WHERE d.total_requests = (SELECT MAX(total_requests) FROM draft)
-- ORDER BY d.requester_id;


WITH counts AS (
SELECT val, COUNT(*) AS num
FROM (
SELECT requester_id AS val FROM RequestAccepted
UNION ALL
SELECT accepter_id FROM RequestAccepted
  ) u
  GROUP BY val
)
SELECT
  val AS id,
  num
FROM counts
WHERE num = (SELECT MAX(num) FROM counts)
ORDER BY id;
