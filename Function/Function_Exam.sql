
----Total Exams Per Student-----
/*
This function returns the total number of exams taken by a specific student 
by counting the rows in the Exam table where the student_id matches the input.
*/
CREATE or alter FUNCTION fn_TotalExamsByStudent (@StudentID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Total INT;
    SELECT @Total = COUNT(*)
    FROM Exam
    WHERE Student_id = @StudentID;

    RETURN @Total;
END;

SELECT dbo.fn_TotalExamsByStudent(1) AS TotalExams;
