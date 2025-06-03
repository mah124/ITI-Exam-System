-- This view lists all students in courses taught by each instructor.
-- It includes instructor information, student information, and course details.

CREATE or alter VIEW instructor_course_students AS
SELECT
    i.Instructor_id,
    su.[User_id] AS "Student UserID",
    c.course_name,
    u.First_name AS student_fname,
    u.Last_name AS student_lname,
    su.age AS student_age
FROM
    instructor i
JOIN [User]u ON i.[User_id] = i.[User_id]
JOIN course c ON c.course_id IN (
    SELECT cs.course_id
    FROM course_student cs
    JOIN student s ON cs.student_id = s.student_id
)
JOIN course_student cs ON cs.course_id = c.course_id
JOIN student s ON cs.student_id = s.student_id
JOIN [User] su ON s.[User_id] = su.[User_id];

select * from instructor_course_students;