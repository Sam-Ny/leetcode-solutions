/* Write your PL/SQL query statement below */
select round(avg(
case 
when state = 'immediate' then 1
else 0
END)*100
    ,2) as immediate_percentage from 
(select 
customer_id, to_char(min(order_date), 'YYYY-MM-DD') as abc, 
to_char(min(customer_pref_delivery_date), 'YYYY-MM-DD') as zxy,
Case
when to_char(min(order_date), 'YYYY-MM-DD') = to_char(min(customer_pref_delivery_date), 'YYYY-MM-DD') then 'immediate'
else 'scheduled'
END as state
from delivery group by customer_id)