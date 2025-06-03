
------------- List Departments with Managers---------
/*
This function returns a list of all departments along with the full name of their assigned 
managers by joining the Departement, Manager, and User tables.
*/
CREATE FUNCTION fn_DepartmentsWithManagers ()
RETURNS TABLE
AS
RETURN (
    SELECT 
        D.Dept_name,
        U.First_name + ' ' + U.Last_name AS ManagerName
    FROM Departement D
    JOIN Manager M ON D.manager_id = M.manager_id
    JOIN [User] U ON M.user_id = U.User_id
);

SELECT * 
FROM dbo.fn_DepartmentsWithManagers();
