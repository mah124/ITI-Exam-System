CREATE or alter VIEW View_Student_UpcomingExams AS
SELECT 
	c.course_id,
	c.Course_name,
    E.Exam_id AS ExamID,
    E.startime_Ex,
    E.endtime_Ex
 -- CAST( CONVERT(VARCHAR(8), E.startime_Ex, 108)AS DATETIME) AS ExamStartDateTime
	FROM Exam E
--HERE GETDATE() > E.startime_Ex

inner join Course c on c.Course_id=e.Course_id


select * from View_Student_UpcomingExams


