create nonclustered index IX_Course_Name 
ON Course (course_name)

select * from Course
where course_name ='Algorithms'