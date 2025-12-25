/* Write your PL/SQL query statement below */

select v1.name as results
from (
select u.name
from movierating mr1 join users u
on mr1.user_id = u.user_id
group by mr1.user_id, u.name
order by count(*) desc, u.name
) v1 
where rownum = 1

UNION ALL

select v2.title as results
from
(select mr2.movie_id, m.title, avg(mr2.rating)
from movierating mr2 join movies m
on mr2.movie_id = m.movie_id
where to_char(mr2.created_at, 'YYYY-MM') = '2020-02'
group by mr2.movie_id, m.title, to_char(TRUNC(mr2.created_at, 'MM'), 'YYYY-MM')
order by avg(mr2.rating) desc, m.title
) v2 
where rownum = 1;


