----------------------------Number of Exams in each Course-----------
create or alter view CourseDetails_v
with schemabinding
as
select 
    c.course_id,
    c.course_name,
    c.max_deg,
    COUNT(e.Exam_id) as NumberOfExams
from Course c
LEFT JOIN dbo.Exam e on c.course_id = e.Exam_id
group by c.course_id, c.course_name,c.max_deg;

----------------------------check	
select * from CourseDetails_v
