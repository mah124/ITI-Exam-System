create view vw_StudentExams as
select distinct 
	ER.st_result,
    e.Exam_id as ExamID,
    e.startime_Ex,
    e.endtime_Ex,
    c.course_name as CourseName
from 
    dbo.Exam_Result ER
    inner join dbo.Exam e on ER.st_result = e.Exam_id
    inner join dbo.Course c on  e.Exam_id = c.course_id;

select *
from vw_StudentExams;