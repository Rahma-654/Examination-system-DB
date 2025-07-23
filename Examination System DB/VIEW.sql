CREATE VIEW vw_USers AS
SELECT
    User_ID AS UserID,
    User_Name AS UserName,
    Gender AS UserGender,
    Phone AS UserPhone,
    City AS UserCity,
    Street AS UserStreet,
    EMail AS UserEmail,
    Role AS UserRole
FROM UserS;
-----------------------------------------------------------------------
CREATE VIEW vw_StudentsOnly AS
SELECT
    User_ID AS UserID,
    User_Name AS UserName,
    Gender AS Gender,
    Phone AS PhoneNumber,
    City AS City,
    Street AS Street,
    EMail AS Email,
    Role AS Role
FROM UserS
WHERE Role = 'student';
===============================================================
CREATE VIEW vw_UsersFromCairo AS
SELECT
    User_ID AS UserID,
    User_Name AS UserName,
    Gender AS Gender,
    Phone AS PhoneNumber,
    City AS City,
    Street AS Street,
    EMail AS Email,
    Role AS Role
FROM UserS
WHERE City = 'Cairo';
-------------------------------------------------------------------
CREATE VIEW vw_OpenExams AS
SELECT 
    e.E_ID, 
    e.E_type, 
    e.start_time, 
    e.end_time
FROM Exam e
WHERE GETDATE() BETWEEN e.start_time AND e.end_time;
=====================================================
CREATE OR ALTER VIEW vw_Users AS
SELECT 
    User_ID, 
    User_Name, 
    Gender, 
    Phone, 
    City, 
    Role
FROM UserS;
====================================================
CREATE VIEW vw_StudentGrades AS
SELECT  
    es.E_id, 
    s.std_ID, 
    u.User_Name AS StudentName, 
    SUM(es.std_grade) AS TotalGrade
FROM Exam_Student es
JOIN Student s ON es.[STD_ID] = s.[std_ID]
JOIN Users u ON s.User_ID_FK = u.User_ID
GROUP BY  es.E_id, s.[std_ID], u.User_Name;
====================================================================
CREATE VIEW vw_InstructorCourses AS
SELECT 
    i.Inst_ID, 
    u.User_Name AS InstructoName, 
    c.Crs_Name AS CourseName, 
    ic.year AS Year
FROM Instructor i
JOIN Users u ON i.User_ID_FK = u.User_ID
JOIN Instractor_Course ic ON i.Inst_ID = ic.Inst_ID
JOIN Course c ON ic.Crs_ID = c.Crs_ID;
-----------------------------------------------------------------
CREATE VIEW CourseTracks AS
SELECT 
    C.Crs_id AS CourseID,
    C.Crs_name AS CourseName,
    T.track_name AS TrackName
FROM 
    Course C
JOIN COURSE_TRACK CT ON C.Crs_id = CT.Crs_id
JOIN track T ON CT.track_id = T.track_id;
--------------------------------------------------------------
CREATE VIEW vw_ExamCourse AS
SELECT 
    e.E_ID AS ExamID,
    e.E_type AS ExamType,
    e.start_time AS ExamStartTime,
    e.end_time AS ExamEndTime,
    c.Crs_ID AS CourseID,
    c.Crs_name AS CourseName
FROM 
    Exam e
JOIN 
    Course c ON e.Crs_ID = c.Crs_ID;
==============================================================
CREATE OR ALTER  VIEW vw_ExamQuestionsAnswers AS
SELECT 
    e.E_ID AS ExamID,
    e.E_type AS ExamType,
    q.Question_iD AS QuestionID,
    q.Question_txt AS QuestionText,
    q.Question_Type AS QuestionType,
    a.answer_iD AS AnswerID,
    a.Answer_Status AS Answer_Status
FROM Exam e
JOIN Exam_Question eq ON e.E_ID = eq.E_ID
JOIN Question q ON eq.Question_iD = q.Question_iD
JOIN Answer a ON q.Question_iD = a.Question_iD;

===================================================

===========================================

