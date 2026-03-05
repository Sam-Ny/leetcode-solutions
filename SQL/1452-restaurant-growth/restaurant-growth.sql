/* Write your PL/SQL query statement below */

select v2.visited_on, v2.moving_sum as amount, round(v2.moving_avg,2) as average_amount from
(select 
case
    when lead(visited_on,6) over(order by v1.visited_on) is not null then to_char(lead(visited_on,6) over(order by v1.visited_on), 'YYYY-MM-DD')
END as visited_on,
case
    when lead(visited_on,6) over(order by v1.visited_on) is not null then sum(v1.tot_amount) over (order by v1.visited_on ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING)
END as moving_sum,
case
    when lead(visited_on,6) over(order by v1.visited_on) is not null then avg(v1.tot_amount) over (order by v1.visited_on ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING)
END as moving_avg
from
(select visited_on, sum(amount) as tot_amount
from customer group by visited_on order by visited_on, sum(amount)) v1 
order by v1.visited_on) v2 where v2.visited_on is not null;

