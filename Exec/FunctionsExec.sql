-------------------------- branch--------------------------------------
/*
1 - This function returns the name and email of the manager responsible for a specific branch
by joining the Branch, Manager, and User tables, filtered by the given branch name.
*/
select * from dbo.fn_GetManagerInfoByBranch('Cairo');

--------------------------course-------------------------------------------
/*
1 - This function returns a distinct list of course names assigned to a specific instructor
by joining the Exam and Course tables using the instructor's ID.
*/
select * from dbo.fn_GetCoursesByInstructor(2); 

---------------------- --department------------------------------------
/*
1 -YThis function returns a list of all departments along with the full name of their assigned 
managers by joining the Departement, Manager, and User tables.
*/
select * from dbo.fn_DepartmentsWithManagers();


-------------------------- Exam---------------------------------------------
/*
1 - This function returns the total number of exams taken by a specific student 
by counting the rows in the Exam table where the student_id matches the input.
*/
select dbo.fn_TotalExamsByStudent(2) as TotalExams;

------------------------- Instructor------------------------------------------
/*
1 -SReturns the total number of exams created by a specific instructor 
using a simple COUNT on the Exam table.
*/
SELECT dbo.CountInstructorExams(2) AS 'Total Exams Created';
-----------------------------------------------------------
/*
2 - Returns a distinct list of courses assigned to a specific instructor 
by joining the Exam and Course tables.
*/
SELECT * FROM dbo.GetInstructorCourses(2);
-----------------------------------------------------
/*
3 - Retrieves a distinct list of students who took exams created by a specific instructor 
by joining Exam, Student, and User tables.
*/
SELECT * FROM dbo.GetInstructorStudents(2);
-----------------------------------------------------
/*
4 - Calculates the percentage of exams passed (degree ≥ min_deg_Ex) 
by students for a specific instructor.
*/
SELECT dbo.GetInstructorPassRate(2) AS 'Pass Rate Percentage';
-------------------------------------------------------------
/*
5 - Returns a summary per course taught by the instructor including
course ID, name, total exams, and average score.
*/
SELECT * FROM dbo.GetInstructorSummary(1);

-----------------------Student------------
/*
1 -ACalculates the final grade of a student in a specific course by summing 
all exam scores for that student and course.
*/
SELECT dbo.fn_GetStudentFinalGrade(1, 1) AS FinalGrade;
/*
2 - Determines if a student passed a specific course by comparing the total 
earned grade to the course's minimum passing degree.
*/
SELECT dbo.fn_IsStudentPassed(1, 1) AS Result;   ---pass
/*
3 - Retrieves the track name of a student by joining the Student and 
Track tables using the student’s track_id.
*/
SELECT dbo.fn_GetStudentTrackName(3) AS StudentTrack;
/*
1 -AReturns the number of students in each track by performing a 
LEFT JOIN between Track and Student tables and grouping by track name.
*/
---------------------------------track---------------
SELECT * FROM dbo.fn_CountStudentsPerTrack();

