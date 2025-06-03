-- StudentExam (for grade lookups)
CREATE INDEX IX_StudentExam_StdID ON [Exam](student_id);
CREATE INDEX IX_StudentExam_ExamID ON [Exam](Exam_id);
