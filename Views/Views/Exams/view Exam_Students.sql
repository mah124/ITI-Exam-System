--------------------------
go
create or alter view Exam_Students 
as
select 
      ER.Exam_id,
	  ER.St_result,
	  U.First_name + ' ' + U.Last_name as 'StudentFullName'
from Exam_Result ER
	inner join Exam E ON E.Exam_id= ER.Exam_id
	inner join dbo.Student S ON S.Student_id=E.Student_id
inner join [User] U ON U.[User_id]=S.[User_id] 


select * from  Exam_Students 
--select Exam_id from dbo.Exam

