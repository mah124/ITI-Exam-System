use examination_iti

----------1-Function to Get Student's Final Grade in a Course-----------
/*
Calculates the final grade of a student in a specific course by summing 
all exam scores for that student and course.
*/
CREATE or alter FUNCTION fn_GetStudentFinalGrade
(
    @student_id INT,
    @course_id INT
)
RETURNS FLOAT
AS
BEGIN
    DECLARE @grade FLOAT;

    SELECT @grade = SUM(Degree)
    FROM Exam
    WHERE Student_id = @student_id AND Course_id = @course_id;

    RETURN @grade;
END;


SELECT dbo.fn_GetStudentFinalGrade(2, 1) AS FinalGrade;


----------2-Function to Check if Student Passed a Course-----------
/*Determines if a student passed a specific course by comparing the total 
earned grade to the course's minimum passing degree.
*/

CREATE or alter FUNCTION fn_IsStudentPassed
(
    @student_id INT,
    @course_id INT
)
RETURNS BIT
AS
BEGIN
    DECLARE @total FLOAT;
    DECLARE @min_deg INT;

    SELECT @total = SUM(Degree)
    FROM Exam
    WHERE Student_id = @student_id AND Course_id = @course_id;

    SELECT @min_deg = Min_deg
    FROM Course
    WHERE Course_id = @course_id;

    RETURN CASE 
               WHEN @total >= @min_deg THEN 1
               ELSE 0
           END;
END;


SELECT dbo.fn_IsStudentPassed(1, 1) AS Result;   ---pass


SELECT SUM(Degree) AS TotalGrade
FROM Exam
WHERE Student_id = 301 AND Course_id = 1;


SELECT min_deg
FROM Course
WHERE Course_id = 1;

----------3-Function to Get Student's Track Name-----------
/*Retrieves the track name of a student by joining the Student and 
Track tables using the student’s track_id.
*/

CREATE FUNCTION fn_GetStudentTrackName
(
    @student_id INT
)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @track_name VARCHAR(50);

    SELECT @track_name = T.Track_name
    FROM Student S
    JOIN Track T ON S.Track_id = T.Track_id
    WHERE S.Student_id = @student_id;

    RETURN @track_name;
END;

SELECT dbo.fn_GetStudentTrackName(3) AS StudentTrack;

