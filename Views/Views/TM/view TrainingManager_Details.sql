
create or alter view TrainingManager_Details
as
SELECT
	b.Branch_name as 'Branch Name',
    M.Manager_id as ' manager id',
    I.Intake_name as 'Intake name',
	u.First_name +' '+ u.Last_name  AS FullName
	
from dbo.[user] u
inner JOIN manager m ON m.[User_id] = u.[User_id]
inner JOIN Branch b ON b.Manager_id = m.Manager_id
inner JOIN Intake I ON i.Branch_id = b.Branch_id
inner JOIN Track T ON t.Intake_id= i.Intake_id

select * from TrainingManager_Details

---------------------------------------------------------------
