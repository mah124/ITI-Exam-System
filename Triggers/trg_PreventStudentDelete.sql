
create or alter trigger trg_PreventStudentDelete
on Student
instead of delete 
as
begin
    if exists  (
        select 1 
        from Exam 
        where Student_id in (select Student_id from deleted)
    )
    begin
        raiserror ('Cannot delete student with existing exam answers.', 16, 1)
        return
    end

    delete from  Student where Student_id in (select Student_id from deleted)
end


delete from Student where Student_id = 1;
