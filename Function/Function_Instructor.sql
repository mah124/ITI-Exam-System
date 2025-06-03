use examination_iti;

----1-Function to Count Exams Created by an Instructor----
/*Returns the total number of exams created by a specific instructor 
using a simple COUNT on the Exam table.
*/

CREATE OR ALTER FUNCTION dbo.CountInstructorExams(@instructor_id INT)
RETURNS INT
AS
BEGIN
    DECLARE @exam_count INT;
    
    SELECT @exam_count = COUNT(*)
    FROM Exam
    WHERE instructor_id = @instructor_id;
    
    RETURN ISNULL(@exam_count, 0);
END;

SELECT dbo.CountInstructorExams(2) AS 'Total Exams Created';


----2-Function to Get Instructor's Course List------------
/*Returns a distinct list of courses assigned to a specific instructor 
by joining the Exam and Course tables.
*/
CREATE FUNCTION dbo.GetInstructorCourses(@instructor_id INT)
RETURNS TABLE
AS
RETURN
(
    SELECT DISTINCT c.course_id, c.course_name
    FROM Exam e
    JOIN Course c ON e.course_id = c.course_id
    WHERE e.instructor_id = @instructor_id
);
GO

SELECT * FROM dbo.GetInstructorCourses(2);


----3-Function to Get Instructor's Students---------------------
/*Retrieves a distinct list of students who took exams created by a specific instructor 
by joining Exam, Student, and User tables.
*/

CREATE FUNCTION dbo.GetInstructorStudents(@instructor_id INT)
RETURNS TABLE
AS
RETURN
(
    SELECT DISTINCT s.Student_id, u.First_name, u.Last_name
    FROM Exam e
    JOIN Student s ON e.student_id = s.Student_id
    JOIN [User] u ON s.user_id = u.User_id
    WHERE e.instructor_id = @instructor_id
);

SELECT * FROM dbo.GetInstructorStudents(2);


-----4-Function to Calculate Pass/Fail Rate for Instructor's Exams-------------
/*Calculates the percentage of exams passed (degree ≥ min_deg_Ex) 
by students for a specific instructor.
*/

CREATE FUNCTION dbo.GetInstructorPassRate(@instructor_id INT)
RETURNS DECIMAL(5,2)
AS
BEGIN
    DECLARE @pass_rate DECIMAL(5,2);
    DECLARE @total_exams INT;
    DECLARE @passed_exams INT;
    
    SELECT @total_exams = COUNT(*)
    FROM Exam
    WHERE instructor_id = @instructor_id;
    
    SELECT @passed_exams = COUNT(*)
    FROM Exam
    WHERE instructor_id = @instructor_id
    AND Degree >= min_deg_Ex;
    
    IF @total_exams > 0
        SET @pass_rate = (@passed_exams * 100.0) / @total_exams;
    ELSE
        SET @pass_rate = 0;
    
    RETURN @pass_rate;
END;


SELECT dbo.GetInstructorPassRate(2) AS 'Pass Rate Percentage';


----5-Function to Get Summary of Instructor's Courses-------------
/*Returns a summary per course taught by the instructor including
course ID, name, total exams, and average score.
*/

CREATE FUNCTION dbo.GetInstructorSummary(@instructor_id INT)
RETURNS @Result TABLE (
    CourseID INT,
    CourseName VARCHAR(100),
    TotalExams INT,
    AvgScore DECIMAL(5,2)
)
AS
BEGIN
    INSERT INTO @Result (CourseID, CourseName, TotalExams, AvgScore)
    SELECT 
        c.course_id,
        c.course_name,
        COUNT(e.exam_id) AS TotalExams,
        AVG(e.degree) AS AvgScore
    FROM 
        Exam e
    JOIN 
        Course c ON e.course_id = c.course_id
    WHERE 
        e.instructor_id = @instructor_id
    GROUP BY 
        c.course_id, c.course_name;

    RETURN;
END;
GO

SELECT * FROM dbo.GetInstructorSummary(1);

