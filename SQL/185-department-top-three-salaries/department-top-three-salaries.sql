/* Write your PL/SQL query statement below */

select d_name as Department, e_name as Employee, salary
from

(select e.id e_id,e.name as e_name,salary,d.Id as d_id, d.name d_name,
dense_rank() over (partition by e.departmentId order by e.salary desc) as rnk
from employee e join department d
on e.departmentId = d.Id)
where rnk <4;
