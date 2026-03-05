
select to_char(Trunc(trans_date, 'MM'), 'YYYY-MM') as month, country, 
count(*) as trans_count,
sum(case
when state = 'approved' then 1
else 0
END) approved_count,
sum(amount) as trans_total_amount,
nvl(sum(case
when state = 'approved' then amount
END),0) approved_total_amount


from transactions group by Trunc(trans_date, 'MM'), country order by trans_count desc;