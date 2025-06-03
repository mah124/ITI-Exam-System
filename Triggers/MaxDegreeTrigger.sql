----------------------Max Degree------------------------
create or alter trigger CheckMaxDegree_TR
on Exam
after insert , update
as
begin
    if EXISTS (
        select e.Exam_id
        from Exam e
        JOIN Course c on e.Course_id = c.Course_id
        where e.Degree > c.Max_deg
    )
    begin
        raiserror ('Total exam degree exceeds course maximum!', 16, 1);
       rollback transaction;
    end;
end;

insert into Exam (Exam_id, Course_id, Degree, startime_Ex, endtime_Ex)
values (102, 2, 80, '2025-06-11 09:00:00', '2025-06-11 11:00:00');


disable trigger CheckMaxDegree_TR on Exam ;

enable trigger CheckMaxDegree_TR on Exam ;

