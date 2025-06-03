
---------Get Course List by Instructor ID---------
/*
This function returns a distinct list of course names assigned to a specific instructor
by joining the Exam and Course tables using the instructor's ID.
*/
CREATE or alter FUNCTION fn_GetCoursesByInstructor (@InstructorID INT)
RETURNS TABLE
AS
RETURN (
    SELECT DISTINCT 
        C.course_name
    FROM Exam E
    JOIN Course C ON E.course_id = C.course_id
    WHERE E.instructor_id = @InstructorID
);


SELECT * 
FROM dbo.fn_GetCoursesByInstructor(2); 
