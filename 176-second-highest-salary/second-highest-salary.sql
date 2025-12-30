/* Write your PL/SQL query statement below */

select max(salary) as SecondHighestSalary 
from
(select
id,salary,
dense_rank() over (order by salary desc) as rank
from
employee)
where rank = 2;

