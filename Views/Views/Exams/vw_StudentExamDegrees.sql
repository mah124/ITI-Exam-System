---------------------------Student Exam score
go
create or alter view vw_StudentExamDegrees 
as
select 
    S.Student_id,
    u.First_name + ' ' + u.Last_name as [Student Full Name], 
	e.Degree as [Total Degree],
    c.course_name as [Course Name]
from dbo.[User] u
JOIN student s on S.[User_id] = u.[User_id]              
JOIN Exam e on e.Student_id = S.Student_id     
join Course as c on  c.Course_id =e.Course_id ;


select * from vw_StudentExamDegrees   