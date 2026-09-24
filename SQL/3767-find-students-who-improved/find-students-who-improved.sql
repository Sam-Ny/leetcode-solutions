
with cte as (
    select 
    student_id,
    subject,
    FIRST_VALUE(score) over (partition by student_id,subject order by exam_date) as first_score,
    LAST_VALUE(score)  over (partition by student_id,subject  order by exam_date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as latest_score
    from 
    scores
)

select distinct * from cte
where first_score < latest_score
order by student_id