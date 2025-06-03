create or alter trigger trg_AfterStudentAnswerInsert
on dbo.Student 
after insert 
as 
begin
     declare @StudentID INT, @ExamID INT,@CourseID INT
	 select top 1
	     Student_id=@StudentID ,
	     Exam_id = @ExamID
     from inserted

     select @CourseID = Course_id 
	 from Exam 
	 where Exam_id = @ExamID

end

insert into Student (Student_id)
values  (323);


