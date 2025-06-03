------------------details of exam join with track , student ,exam result , course 
CREATE VIEW ExamDetails AS
SELECT 
    e.Exam_id AS exam_id,
    c.course_id AS course_id,
    c.course_name AS course_name,
    COALESCE(MIN(t.track_name), '') AS track,
    e.startime_Ex AS start_time,
    e.endtime_Ex AS end_time
FROM dbo.Exam e
LEFT JOIN Course c ON c.course_id = e.Exam_id  -- Changed from e.Exam_id to e.course_id
LEFT JOIN Exam_Result er ON er.exam_id = e.Exam_id
LEFT JOIN Student s ON s.Student_id = e.Student_id
LEFT JOIN Track t ON t.Track_id = s.Track_id
GROUP BY 
    e.Exam_id, 
    c.course_id, 
    c.course_name, 
    e.startime_Ex, 
    e.endtime_Ex;

select * from ExamDetails
order by exam_id
---------------------------------------
select * from Exam
