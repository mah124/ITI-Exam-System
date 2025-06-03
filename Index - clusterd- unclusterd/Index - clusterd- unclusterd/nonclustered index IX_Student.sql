create nonclustered index IX_Student_Name 
ON dbo.[User] (First_name,Last_name)


SELECT * 
FROM dbo.[User] 
WHERE First_name = 'Rana' AND Last_name = 'Ali';







