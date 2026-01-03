/* Write your PL/SQL query statement below */
select v1.Department, v1.Employee, v1.salary
from
(
select 
d.name as Department, e.name as Employee, e.salary as salary,
dense_rank() over (partition by d.name order by salary desc) rnk
from 
employee e join department d on e.departmentID = d.ID
) v1 where rnk <2;

