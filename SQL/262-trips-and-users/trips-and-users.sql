# Write your MySQL query statement below
WITH TripStatus As
(
    Select 
    client_id,
    driver_id,
    request_at as Day,
    t.status != 'completed' as cancelled
    from 
    trips t
    join users u on t.client_id = u.users_id and u.banned = 'No'
    join users v on t.driver_id = v.users_id and v.banned = 'No' 
    where t.request_at between '2013-10-01' and '2013-10-03'
)
select 
Day,
round(sum(cancelled)/count(cancelled), 2) as 'Cancellation Rate'
from tripstatus
group by Day