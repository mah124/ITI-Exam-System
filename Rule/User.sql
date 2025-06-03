------ Check that user is one of three choices
CREATE RULE role_rule
AS 
@Rolee IN ('student', 'instructor', 'manager');

EXEC sp_bindrule 'role_rule', 'User.Rolee'; --------------------------- Apply Rule



-- Create rule for basic email format
CREATE RULE email_rule
AS @Email LIKE '%_@__%.__%';

-- Bind to Email column
EXEC sp_bindrule 'email_rule', 'User.Email';