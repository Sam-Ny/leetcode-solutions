/* Write your PL/SQL query statement below */

select swapped_id as id, student
from
(Select id, student,
case 
    when MOD(id, 2) != 0 and lead(id) over (order by id) is Null then id
    when MOD(id, 2) != 0 then lead(id) over (order by id)
    when MOD(id, 2) = 0 then lag(id) over (order by id)
    END as swapped_id
from seat) order by swapped_id;