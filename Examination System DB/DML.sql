INSERT INTO Users(User_ID, User_Name, Gender, Phone, City, Street, Password, EMail, Role)
VALUES 
(5, 'Sara Mostafa', 'f', '01234567890', 'Giza', 'Faisal', 'pass456', 'sara@example.com', 'student'),
(6, 'Hassan Youssef', 'm', '01123456789', 'Alexandria', 'Stanley', 'pass789', 'hassan@example.com', 'training manager')
--------------------------------------------------------------
INSERT INTO Instructor (user_ID) VALUES (1);
INSERT INTO Student (user_ID) VALUES (2);
INSERT INTO Train_Manager (user_ID) VALUES (3);

----------------------------------------------------------------------
INSERT INTO Intake (year, Intake_name, Mng_ID)
VALUES (2024, ' Intake 2024', 3);
------------------------------------------------------------------------
INSERT INTO branch (branch_id, branch_name, year)
VALUES (10, 'Cairo', 2024);
--------------------------------------------------------------
INSERT INTO department (debartment_id, debartment_name)
VALUES (600, 'Data Sceince');
-----------------------------------------------------------------------
INSERT INTO track (track_id, track_name,Dept_ID)
VALUES (500, 'power pi Development',600);


-------------------------------------------------------------------------
INSERT INTO Course (Crs_id, Crs_name, Describtion, min_degree, max_degree)
VALUES (101, 'Database fundmental', 'Introduction to SQL', 60, 100);

------------------------------------------------------------------------------
INSERT INTO EXAM (E_id, TE_type, start_time, end_time, total_time, Crs_id)
VALUES (201, 'midterm', '2025-05-23 10:00:00', '2025-05-23 11:00:00', 60, 101);

----------------------------------------------------------------------------------
INSERT INTO question (Question_iD, Question_txt, Question_grade, Question_Type, Crs_id)
VALUES (301, 'What is a primary key?', 10, 'text', 101);
----------------------------------------------------------------------------------
INSERT INTO Answer (answer_iD, answer_stutas, Question_iD)
VALUES (401, 'A unique identifier for table rows', 301);
-----------------------------------------------------------------
insert into COURSE_TRACK(Crs_id,track_id)
values(101,500)
----------------------------------------------------------------
insert into Debt_branch(department_id,branch_id)
values(600,10)
---------------------------------------------------------------
insert into EXAM_QUESSTION(E_id,Question_iD)
values(201,301)
---------------------------------------------------------
insert into EXAM_STUDENT(STD_ID,E_ID,std_Grade,std_Answer)
values (200,201,96,'A unique identifier for table rows')
---------------------------------------------------------
insert into Instractor_Course(Crs_id,Inst_id,year)
values(101,100,2024)
------------------------
insert into Instractor_Exam(E_id,Inst_ID)
values(201,100)
------------------------------------
insert into student_debartment_intake(Std_ID,track_id,year)
values(200,500,2024)
------------------------------------
insert into COURSE_TRACK(Crs_id,track_id)
values(101,500)
--------------------------------------------------
insert into Debt_branch(department_id,branch_id)
values(600,10)


