/* Write your PL/SQL query statement below */

select round(sum(tiv_2016),2) as tiv_2016
from insurance i
where tiv_2015 in (select i1.tiv_2015 from insurance i1
where i.tiv_2015 = i1.tiv_2015 and (i.lat <> i1.lat or i.lon <> i1.lon))
and
1 = (select count(*) from insurance i2 where
i.lat = i2.lat and i.lon = i2.lon);

