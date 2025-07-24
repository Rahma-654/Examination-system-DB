--- Fuction_1
--- function GetuserInfo to get all info about the user, and to get the result you must enter param UserID

create function GetuserInfo(@UserID int)
returns table
as
return (
       select * from Useer 
	   where User_ID= @UserID
)

--Test 
select * from GetuserInfo(1)
------------------------------------------------------------------------------------------------------------------
--- Fuction_2
--- function GetInstInfo to get all info about instractors, and to get the result you must enter param InstID

create function GetInstInfo(@InstID int)
returns table 
as
return (
       
       select * from Useer u inner join Instructor ins
	   on Ins.User_ID_FK = u.User_ID
	   where Inst_ID= @InstID

)

--Test
select * from GetInstInfo(100)
--------------------------------------------------------------------------------------------------------------------
--- Fuction_3
--- function GetStdInfo to get all info about the Students, and to get the result you must enter param StdID

create function GetStdInfo(@StdID int)
returns table
as
return (
       select * from Useer u inner join Student s
	   on s.User_ID_FK = u.User_ID
	   where Std_ID= @StdID
)

--Test 
select * from GetStdInfo(200)
-------------------------------------------------------------------------------------------------------------------
--- Fuction_4
--- function GetMngInfo to get all info about instractors, and to get the result you must enter param MngID

create function GetMngInfo(@MngID int)
returns table
as
return (
       select * from Useer u inner join Train_Manager M
	   on M.User_ID_FK = u.User_ID
	   where Mng_ID= @MngID
)

--Test 
select * from GetMngInfo(300)
-------------------------------------------------------------------------------------------------------------------
--- Fuction_5
--- function GetStdTrackInfo to get info student's track, and to get the result you must enter param StudentID

create function GetStdTrackInfo(@StudentID int)
returns table
as
return(
       select sdi.*, branch_name, I.Intake_name ,t.track_name
	   from student_debartment_intake sdi
	   inner join track t on sdi.track_id = t.track_id
	   inner join Intake I on sdi.year= I.year
	   inner join branch b on b.year= I.year
	   where Std_ID= @StudentID
)

--Test 
select * from GetStdTrackInfo(200)
-------------------------------------------------------------------------------------------------------------------
--- Fuction_6
--- function GetInstructorCourses to the courses to each instractor, and to get the result you must enter param InstID

CREATE or alter FUNCTION GetInstructorCourses(@InstID INT)
RETURNS TABLE
AS
RETURN (
    SELECT c.Crs_id, c.Crs_name, u.User_Name Inst_Name
    FROM Instractor_Course ic
    inner join Course c on ic.Crs_id = c.Crs_id 
	inner join Instructor Ins on ic.Inst_ID = Ins.Inst_ID
	inner join Useer u on Ins.User_ID_FK = u.User_ID
    WHERE ic.Inst_ID = @InstID
)

--Test 
select * from GetInstructorCourses(100)
--------------------------------------------------------------------------------------------------------------------
--- Fuction_7
--- function GetStdGrades to get Student's grad in an exam, and to get the result you must enter params 
--- ExamID and StudentID
create function GetStdGrades(@ExamID int, @StudentID int)
returns int
as
begin
    declare @grad int

	select @grad= std_grade from EXAM_STUDENT
	where Std_ID= @StudentID and E_id= @ExamID

	return @grad
end

--Test 
select dbo.GetStdGrades(201,200) as Grad
-------------------------------------------------------------------------------------------------------------------
--- Fuction_8
--- function GetStdExams to get all Student exams and grads, and to get the result you must enter param StudentID

create function GetStdExams(@StudentID int)
returns table
as
return(
       select es.E_id ExamID, es.std_grade Grad, c.Crs_id CourseID, c.Crs_name Course_Name
	   from EXAM_STUDENT es
	   inner join Exam e ON es.E_id = e.E_id
       inner join Course c ON e.Crs_id = c.Crs_id 
       WHERE es.Std_ID = @StudentID
)
--Test 
select * from GetStdExams(200)
--------------------------------------------------------------------------------------------------------------------
--- Fuction_9
--- function GetExamQus to get all the questions in the exam with their types, and to get the result you
--- must enter param ExamtID
create or alter function GetExamQus(@ExamID int)
returns @t table(
         QuestionType varchar(30),
		 QuestionCount INT,
		 Total_Qus_grade int
)
as
begin
    insert into @t
    select q.Question_Type, count(eq.Question_iD), sum(q.Question_grade) 
	from question q inner join EXAM_QUESSTION eq on eq.Question_iD= q.Question_iD
	where eq.E_id= @ExamID
	group by Question_Type

	return
end

--Test 
select * from GetExamQus(201)
-------------------------------------------------------------------------------------------------------------------
--- Fuction_10
--- function GetCourseinfo to the get all info about any course, and to get the result you must enter param course_ID

CREATE FUNCTION GetCourseinfo(@Crs_id INT)
RETURNS TABLE
AS
RETURN (
    SELECT * FROM Course 
    where Crs_id= @Crs_id
)

--Test 
select * from GetCourseinfo(101)
-------------------------------------------------------------------------------------------------------------------
--- Fuction_11
--- function GetExaminfo to the get all info about any Exam, and to get the result you must enter param Exam_ID

CREATE FUNCTION GetExaminfo(@E_id INT)
RETURNS TABLE
AS
RETURN (
    SELECT * FROM Exam 
    where E_id= @E_id
)

--Test 
select * from GetExaminfo(201)
-------------------------------------------------------------------------------------------------------------------
--- Fuction_12
--- function Getquesans to the get all info about the Question and it's answers, and to get the result you must enter param Question_ID

CREATE or alter FUNCTION GetQuestsAns(@Q_id INT)
RETURNS TABLE
AS
RETURN (
    SELECT q.* , answer_stutas, answer_iD
	FROM question q inner join Answer a on a.Question_iD= q.Question_iD
    where q.Question_iD= @Q_id
)

--Test 
select * from GetQuestsAns(301)
-------------------------------------------------------------------------------------------------------------------
--- Fuction_13
--- function GetExamInst to the get the instractor name who have put a spasifice exam, and to get the result
--  you must enter params Exam_ID and instractor_id

CREATE FUNCTION GetExamInst(@E_id int, @inst_id INT)
RETURNS TABLE
AS
RETURN (
    SELECT IE.* , U.User_Name
	FROM Instractor_Exam IE inner join Instructor I on IE.Inst_ID= i.Inst_ID
	     inner join useer U on I.User_ID_FK = U.User_ID
    where IE.E_id= @E_id and IE.Inst_ID = @inst_id
)

--Test 
select * from GetExamInst(201,100)






