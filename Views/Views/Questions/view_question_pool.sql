-------------------question view for student
go
create or alter view vw_Question
with schemabinding
as
select 
    q.Question_id as QuestionID,
    q.KeyWords_Text_Q as QuestionType,
    q.MCQ_Q,
    q.Correct_Answer_Q,
	q.Marks_Q,
	q.True_false_q,
	q.text_Q
from dbo.Question q;

select * from vw_Question;