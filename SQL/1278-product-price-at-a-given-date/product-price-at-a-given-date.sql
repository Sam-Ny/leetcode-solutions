/* Write your PL/SQL query statement below */






SELECT p1.product_id,
       COALESCE(
         (
           SELECT MAX(p2.new_price)
                  KEEP (DENSE_RANK LAST ORDER BY p2.change_date)
           FROM products p2
           WHERE p2.product_id = p1.product_id
             AND p2.change_date <= DATE '2019-08-16'
         ),
         10
       ) AS price
FROM (SELECT DISTINCT product_id FROM products) p1;


