--------------------INDEX IN  USER NAME-----------------
CREATE NONCLUSTERED INDEX IX_Useer_User_Name
ON Users(User_Name);
-------------------------------INDEX IN COURSE NAME---------------
CREATE NONCLUSTERED INDEX IX_Course_Name
ON Course(Crs_name);
--------------------------QUESTION TYPE--------------
CREATE NONCLUSTERED INDEX IX_Question_Type
ON Question(Question_Type);
----------------- INDEX IN Answer_Status---------------------
CREATE NONCLUSTERED INDEX IX_Answer_Status
ON Answer(Answer_Status);

--------------------INDEX IN Track_Name
CREATE NONCLUSTERED INDEX IX_Track_Name
ON Track(track_name);
-------------------------INDEX IN std_grade---------------------
CREATE NONCLUSTERED INDEX IX_Exam_Student_std_grade
ON EXAM_STUDENT(std_grade);
---------------------------------------------------
