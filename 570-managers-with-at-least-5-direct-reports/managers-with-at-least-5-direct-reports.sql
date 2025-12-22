# Write your MySQL query statement below
select name from employee where ID in (select managerID from employee where managerID is not null group by managerID having count(*) >=5);