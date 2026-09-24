
with cte as (
    select 
    student_id,
    subject,
    FIRST_VALUE(score) over (partition by student_id,subject order by exam_date) as first_score,
    FIRST_VALUE(score)  over (partition by student_id,subject  order by exam_date desc) as latest_score
    from 
    scores
)

select student_id, subject, first_score, latest_score  from cte
where first_score < latest_score
group by student_id, subject, first_score, latest_score 
order by student_id