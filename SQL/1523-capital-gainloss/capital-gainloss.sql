# Write your MySQL query statement below
with cte as (
    select *,
    case 
    when operation = "Buy" then price*-1
    else price
    END as actual_price
    from 
    stocks
)

select
stock_name, 
sum(actual_price) as capital_gain_loss
from
cte
group by stock_name

