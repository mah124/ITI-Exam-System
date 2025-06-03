--create database Examination_ITI ;
use [Examination_ITI]

create table [User] ( 
[User_id] int primary key identity ,
First_name varchar(40) , 
Last_name varchar(40) , 
Email  varchar(40) , 
age int check (age >0 and age <= 65 ),
Gender varchar(6) , 
Rolee  varchar(20) , 
address varchar(50) , 
phone varchar(15) check (phone like '[0-9]%')

)
ON FG_Users;

create table Manager (

manager_id int  primary key ,
[user_id] int  foreign key ([user_id]) references [User]([User_id])

)
ON FG_Users;


create table  Branch (


branch_id int primary key identity,
branch_name varchar(30),
manager_id int foreign key (manager_id) references Manager(manager_id)

) 
ON FG_Admin;

create table Intake (
intake_id int primary key  ,
intake_name varchar(50) not null  ,
manager_id int ,

 branch_id int, foreign key (branch_id) references  Branch(branch_id),
 foreign key (manager_id) references Manager(manager_id)

)
ON FG_Admin;

create table Track (
track_id int primary key , 
track_name varchar(40) , 
intake_id  int foreign key (intake_id) references  Intake(intake_id) 
)
ON FG_Admin;

create table  Departement (
Dept_id  int primary key , 
Dept_name varchar(30) , 
manager_id int foreign key (manager_id) references Manager(manager_id)
)
ON FG_Admin;

create table Track_dept ( 
Dept_id  int , 
Track_id int , 

primary key (Dept_id,Track_id), 

foreign key (Dept_id) references  Departement(Dept_id) , 

foreign key (track_id) references  Track(track_id)

)
ON FG_Admin;


create table Student (
Student_id int primary key , 
[user_id] int , 
track_id int , 
manager_id int 

foreign key ([user_id]) references [User]([User_id]) , 

foreign key (track_id) references Track(track_id), 

foreign key (manager_id) references Manager(manager_id) 

)
ON FG_Users;

create table  Instructor(
instructor_id int primary key not null ,
[user_id] int , 
foreign key ([user_id]) references [User]([User_id]) 

)
ON FG_Users;



create table Course ( 
course_id int primary key  ,
course_name varchar(50) ,
description varchar(300) , 
max_deg int  check(max_deg > 0 ) , 
min_deg int check(min_deg > 0 ) ,
text_q varchar(500)
) 
ON FG_Courses;

create table Exam ( 
Exam_id int primary key  ,
instructor_id int , 
course_id int , 
student_id int , 
main_ex varchar(500) , 
startime_Ex datetime , 
endtime_Ex datetime , 
corrective_Ex varchar(300) ,
t_marks_Ex  varchar(300) , 
min_deg_Ex int check(min_deg_Ex > 0 ), 
max_deg_Ex int  check(max_deg_Ex > 0 ) , 
Degree float  check(Degree > 0 ),

foreign key (instructor_id) references Instructor(instructor_id), 
foreign key (course_id) references Course(course_id), 
foreign key (student_id) references Student(student_id) 

 
) 
ON FG_Courses;

create table Exam_Result ( 
st_result int primary key  ,
exam_id int , 
score varchar(300) , 
completed varchar(300) , 
pending varchar(100)

foreign key (exam_id) references Exam(Exam_id)

) 
ON FG_Courses;

create table Course_Student (
student_id int , 
course_id int 
primary key (student_id,course_id),
foreign key (student_id)  references Student(Student_id) , 
foreign key (course_id)  references Course(course_id)  

)
ON FG_Courses;

create table Track_course (
track_id int , 
course_id int ,
primary key (track_id,course_id),

foreign key (track_id)  references Track(track_id) , 
foreign key (course_id)  references Course(course_id)  

)
ON FG_Courses;



-------------------------------------------
SELECT 
    t.name AS TableName,
    fg.name AS FileGroupName
FROM 
    sys.tables t
JOIN 
    sys.indexes i ON t.object_id = i.object_id
JOIN 
    sys.data_spaces fg ON i.data_space_id = fg.data_space_id
WHERE 
    i.type <= 1   
ORDER BY 
    t.name;


