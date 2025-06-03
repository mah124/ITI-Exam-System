create or alter view Student_Course_Details 
as
select
u.First_name + ' ' + u.Last_name as 'Full Name',
c.course_name as 'Course Name',
t.Track_name as 'Track Name'
from dbo.[User] u

inner join Student s on s.[User_id] =u.[User_id]
inner join Track t on t.Track_id=s.Track_id
inner join Track_course tc on tc.Track_id=t.Track_id
inner join Course c on c.Course_id=tc.Course_id

select * from Student_Course_Details 
ORDER BY [Full Name]
