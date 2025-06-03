
-------Get Manager Info by Branch Name-----------
/*
This function returns the name and email of the manager responsible for a specific branch
by joining the Branch, Manager, and User tables, filtered by the given branch name.
*/

CREATE or alter FUNCTION fn_GetManagerInfoByBranch (@BranchName VARCHAR(50))
RETURNS TABLE
AS
RETURN (
    SELECT 
        U.First_name + ' ' + U.Last_name AS ManagerName,
        U.Email,
        B.branch_name
    FROM Branch B
    JOIN Manager M ON B.manager_id = M.manager_id
    JOIN [User] U ON M.user_id = U.User_id
    WHERE B.branch_name = @BranchName
);

SELECT * 
FROM dbo.fn_GetManagerInfoByBranch('Cairo');
