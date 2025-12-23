select 
s.user_id , 
Round(NVL(AVG(Case
When c.action = 'confirmed' then 1
When c.action = 'timeout' then 0
else null 
END),0),2) as confirmation_rate
from signups s left join confirmations c on s.user_id = c.user_id group by s.user_id;