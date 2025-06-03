# ITI-Exam-System-
                                                        🔧 System Requirements

Provide question pool for exam creation.
Question types::
Multiple choice, True/False, Text.
Store correct answers & evaluate student responses.
Text answers checked instructor reviews invalid ones manually.
Store course info (Student name , description , max/min degree).
Store instructor and student info.
One instructor may teach multiple courses; a course has one instructor per class.

Training Manager can::
Add-edit : branches, tracks, intakes.
Add students with personal data, intake, branch, and track.
Login accounts for: Training Manager, Instructors, Students.

Instructors can::
Create exams (random/manual question selection).
Assign marks per question, ensuring total ≤ course max degree.
Define exam type (normal/corrective), intake, branch, track, course, timings, allowance.
Assign exams to specific students with time constraints.

Store::
Exams , course , instructor.
Student answers & results.
Insert and test with dummy data by using Redgate data generator , Chat GPT ,Github Copilot 

                                                          💻 Technical Requirements
*Create DDL on File Groups 
*Inserting Data
*Use stored procedures & functions for all concept and logics .
*Use views to display data for users.
*Use triggers for data integrity and access control.
*Create indexes for performance.

Create 4 users::
--Admin
--Training Manager
--Instructor
--Student

Backup::
Make a Backup Plan Daily 
--Full Backup 
--Differnianl 
--Transaction


