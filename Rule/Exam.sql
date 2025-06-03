-- Create rule for keyword text length
CREATE RULE keywords_rule
AS 
LEN(@KeyWords_Text_Q) <= 200;

-- Bind to KeyWords_Text_Q column
EXEC sp_bindrule 'keywords_rule', 'Question.KeyWords_Text_Q';



-- Create rule to validate Exam_id exists in Exam table
CREATE RULE exam_reference_rule
AS 
@Exam_id IN (SELECT Exam_id FROM Exam) OR @Exam_id IS NULL;

-- Bind to Exam_id column
EXEC sp_bindrule 'exam_reference_rule', 'Question.Exam_id';