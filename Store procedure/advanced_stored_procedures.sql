
create or alter proc UpdateStudentInfo
@StudentId int,
@FirstName nvarchar(40),
@LastName nvarchar(40),
@Email nvarchar(40),
@Age int,
@Gender nvarchar(6),
@Address nvarchar(50),
@Role NVARCHAR(20), 
@Phone nvarchar(15)
as
begin
 declare @UserId int
 select @UserId = [User_id] from Student where Student_id = @StudentId

update[User]
set First_name = @FirstName,
Last_name = @LastName,
Email = @Email,
Age = @Age,
Gender = @Gender,
[Address] = @Address,
[Role]= @Role,
 Phone = @Phone
where [User_id] = @UserId
end;

exec UpdateStudentInfo 200, 'AHMED', 'SAYED' , 'AHMEDSAYED65958@GMAILCOM', 25 , 'MALE' , 'MINIA' , 'instructor' , '01024957613' 
-------------------------------------------------------------د=\


create or alter proc AddNewInstructor
    @FirstName varchar(40),
    @LastName varchar(40),
    @Email varchar(40),
    @Age int,
    @Gender varchar(6),
    @Address varchar(50),
    @Phone varchar(15)
as
begin
    insert into [User] (First_name, Last_name, Email, Age, Gender, [Role], [Address], Phone)
    values (@FirstName, @LastName, @Email, @Age, @Gender, 'Instructor', @Address, @Phone);

    declare @NewUserId int = SCOPE_IDENTITY();

    insert into Instructor ([User_id])
    values (@NewUserId);
end;
go

exec AddNewInstructor  'osama' , 'sayed' , 'osama@gmail.com' , 28,'Male' , 'minya' , '01024569765'

-----------------------------9--
create or alter proc GetCoursesByTrack
    @TrackId int
as
begin
    select c.Course_id, c.Course_name
    from Track_course tc
    JOIN Course c on tc.Course_id = c.Course_id
    where tc.Track_id = @TrackId
end;
GO

create or alter proc GetCourseGrades
    @CourseId int
AS
BEGIN
    select u.First_name, u.Last_name, e.Degree, e.Max_deg_Ex
    FROM Exam e
    JOIN Student s ON e.Student_id = s.Student_id
    JOIN [User] u ON s.[User_id] = u.[User_id]
    where e.Course_id = @CourseId
end;
GO
exec GetCourseGrades 1

create or alter proc GetTopStudents
    @TopN INT
AS
BEGIN
    select TOP (@TopN) u.First_name, u.Last_name, AVG(e.Degree) AS AvgDegree
    FROM Exam e
    JOIN Student s ON e.Student_id = s.Student_id
    JOIN [User] u ON s.[User_id] = u.[User_id]
    GROUP BY u.First_name, u.Last_name
    ORDER BY AvgDegree DESC
END;
GO
 exec GetTopStudents 5

create or alter proc getstudentcountbytrack
as
begin
    select t.track_name, count(s.student_id) as totalstudents
    from track t
    left join student s on t.track_id = s.track_id
    group by t.track_name
end;
go

exec getstudentcountbytrack;

create  or alter procedure getstudentfullreport
    @studentid int
as
begin
    select u.first_name, u.last_name, u.email, u.phone, t.track_name, c.course_name, e.degree
    from student s
    join [user] u on s.[user_id] = u.[user_id]
    left join track t on s.track_id = t.track_id
    left join exam e on s.student_id = e.student_id
    left join course c on e.course_id = c.course_id
    where s.student_id = @studentid
end;
GO


exec GetStudentFullReport 1 


create or alter proc add_student
    @first_name varchar(40),
    @last_name varchar(40),
    @email varchar(40),
    @age  int,
    @gender varchar(6),
    @address varchar(50),
    @phone varchar(15),
    @trackid int,
    @manager_id int
AS
BEGIN
    INSERT INTO [User] (First_name, Last_name, Email, Age, Gender, [Role], [Address], Phone)
    VALUES (@first_name, @last_name, @email, @age, @gender, 'Student', @address, @phone);

    DECLARE @NewUserId INT = SCOPE_IDENTITY();

    INSERT INTO Student ([User_id], Track_id, Manager_id)
    VALUES (@NewUserId, @trackid, @manager_id);
END;

exec add_student 'Yousef' , 'khaled' , 'yousefKhaled@gmail.com' , 26 ,'male' , 'minya', '01024659873' , 2 , 1  

create or alter proc AddExam
@Exam_id int,
@instructor_id int,
@CourseId int,
@StudentId int,
@MainEx varchar(500),
@StartTime DATETIME,
@EndTime DATETIME,
@Corrective varchar(300),
@TMarks varchar(300),
@MinDeg int,
@MaxDeg int,
@Degree float
as
begin
    insert into Exam (
Exam_id,Instructor_id, Course_id, Student_id, Main_ex,
Startime_Ex, Endtime_Ex, Corrective_Ex, T_marks_Ex,
Min_deg_Ex, Max_deg_Ex, Degree)
    values (
        @Exam_id,@instructor_id, @CourseId, @StudentId, @MainEx,
        @StartTime, @EndTime, @Corrective, @TMarks,
        @MinDeg, @MaxDeg, @Degree)

		end


exec AddExam @Exam_id = 9 , @instructor_id = 2,@CourseId = 1,@StudentId = 3,@MainEx = 'Midterm Exam',@StartTime = '2025-10-10 09:00:00',
@EndTime = '2025-10-10 11:00:00',@Corrective = 'No correction needed',@TMarks = '50',@MinDeg = 25,@MaxDeg = 50,@Degree = 45.5;

create proc CreateQuestion
    @QuestionText nvarchar (max),
    @QuestionTypeId int
as
begin
    insert into QuestionBank (QuestionText, QuestionTypeId)
    values (@QuestionText, @QuestionTypeId);
end;

exec CreateQuestion 
    @QuestionText = 'what is c++',
    @QuestionTypeId = 10;