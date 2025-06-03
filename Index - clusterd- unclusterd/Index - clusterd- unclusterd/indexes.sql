create index IX_StudentExam_ExamID_StdID on [dbo].Exam(Exam_id, student_id);

select * 
from Exam 
where Exam_id = 2;

select * 
from Exam 
where Exam_id = 1 and student_id = 1;

create index IX_QuestionPick_Exam_Inst on dbo.Question (Exam_id, Question_id);

select * 
from Question 
where Exam_id = 1;

select * 
from Question 
where Exam_id = 1 and Question_id = 1;

create index IX_StudentCourse_CourseID on dbo.Course_Student (Course_id);

select * 
from Course_Student 
where course_id = 6;

create nonclustered index IX_QuestionPool_ID_Answer on dbo.Question (question_id) include (Correct_Answer_Q);

select question_id, Correct_Answer_Q 
from Question 
where question_id = 2;