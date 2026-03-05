/* Write your PL/SQL query statement below */


SELECT
  product_id,
  year AS first_year,
  quantity,
  price
FROM (
  SELECT
    product_id,
    year,
    quantity,
    price,
    MIN(year) OVER (PARTITION BY product_id) AS min_year
  FROM sales
) s
WHERE s.year = s.min_year;

