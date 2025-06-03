
----------Count of Students per Track-----------
/*Returns the number of students in each track by performing a 
LEFT JOIN between Track and Student tables and grouping by track name.
*/

CREATE FUNCTION fn_CountStudentsPerTrack ()
RETURNS TABLE
AS
RETURN (
    SELECT 
        T.track_name,
        COUNT(S.Student_id) AS StudentCount
    FROM Track T
    LEFT JOIN Student S ON T.track_id = S.track_id
    GROUP BY T.track_name
);

SELECT * 
FROM dbo.fn_CountStudentsPerTrack();
