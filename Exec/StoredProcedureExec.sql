----add new instructor by identity last id (Stored Procedure  )
exec AddNewInstructor  'osama' , 'sayed' , 'osama@gmail.com' , 28,'Male' , 'minya' , '01024569765'

----Aadd new student 

exec add_student 'Yousef' , 'khaled' , 'yousefKhaled@gmail.com' , 26,'male' , 'minya', '01024659873' , 2 , 1 

----updata student information by id (Stored procedure ) 
exec UpdateStudentInfo 310, 'AHMED', 'SAYED' , 'AHMEDSAYED65958@GMAILCOM', 25 , 'MALE' , 'MINIA' , 'instructor' , '01024957613' 

----------------------------------------
------getstudentcountbytrack

exec getstudentcountbytrack;

----------------------------------
------ get all about student track , course , degree (full report ) 

exec GetStudentFullReport 1  

---------------------------------------
----- SGEt Top student that have high grade 
--------------------------------
exec GetTopStudents  2

-----
exec CreateQuestion 
    @QuestionText = 'what is C#',
    @QuestionTypeId = 10;
----------------------
--YGet all courses by track 
exec GetCoursesByTrack 1
----report  
exec GetCourseGrades 1
------------------------------------------
----AAdd Exam 
exec AddExam @Exam_id = 9 , @instructor_id = 2,@CourseId = 2,@StudentId = 3,@MainEx = 'Midterm Exam',@StartTime = '2025-10-10 09:00:00',
@EndTime = '2025-10-10 11:00:00',@Corrective = 'No correction needed',@TMarks = '50',@MinDeg = 25,@MaxDeg = 50,@Degree = 45.5;







