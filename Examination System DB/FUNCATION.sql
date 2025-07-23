--- Fuction_1
--- function GetuserInfo to get all info about the user, and to get the result you must enter param UserID

create function GetuserInfo(@UserID int)
returns table
as
return (
       select * from Users 
	   where User_ID= @UserID
)

--Test 
select * from GetuserInfo(1)
-------------------------------------------------------------------------------------------------------------------
--- Fuction_2
--- function GetTrackCourses to get all coures in the track, and to get the result you must enter param courseID
--- branches intakes
create or alter function GetTrackCrs(@T_ID int)
returns table
as
return(
       select ct.Track_ID, t.Track_Name, c.Crs_name 
	   from Course_Track ct
	   inner join Track t on ct.Track_ID= t.Track_ID
	   inner join Course c on ct.Crs_ID = c.Crs_id
	   where ct.Track_ID= @T_ID
)

--Test 
select * from GetTrackCrs(200)
-------------------------------------------------------------------------------------------------------------------
--- Fuction_3
--- function GetInstructorCourses to the courses to each instractor, and to get the result you must enter param InstID

CREATE or alter FUNCTION GetInstCrs(@InstID INT)
RETURNS TABLE
AS
RETURN (
    SELECT ic.Crs_ID, c.Crs_name,IC.Inst_ID, u.User_Name Inst_Name, IC.Year
    FROM Instructor_Course ic
    inner join Course c on ic.Crs_id = c.Crs_id
	inner join Instructor Ins on ic.Inst_ID = Ins.User_ID
	inner join Users u on Ins.User_ID = u.User_ID
    WHERE ic.Inst_ID = @InstID
)

--Test 
select * from GetInstCrs(100)
--------------------------------------------------------------------------------------------------------------------
--- Fuction_4
--- function GetStdGrades to get Student's grad in an exam, and to get the result you must enter params 
--- ExamID and StudentID
create OR ALTER function GetStdGrade(@ExamID int, @StudentID int)
returns int
as
begin
    declare @grad int

	select @grad= Total_Grade
	from Student_Exam_Total_Grade 
	where Student_ID= @StudentID and E_id= @ExamID

	return @grad
end

--Test 
select dbo.GetStdGrade(201,200) as Grad
-------------------------------------------------------------------------------------------------------------------
--- Fuction_5
--- function GetStdExams to get all Student exams and grads, and to get the result you must enter param StudentID

create or alter function GetStdExams(@StudentID int)
returns table
as
return(
       select se.Student_ID, se.Total_Grade, c.Crs_id CourseID, c.Crs_name Course_Name, E.E_id, E.E_Type Exam_Type
	   from Student_Exam_Total_Grade se
	   inner join Exam e ON se.E_id = e.E_id
       inner join Course c ON e.Crs_id = c.Crs_id
       WHERE se.Student_ID = @StudentID
)
--Test 
select * from GetStdExams(200)
--------------------------------------------------------------------------------------------------------------------
--- Fuction_6
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
	from question q inner join Exam_Question eq on eq.Question_iD= q.Question_iD
	where eq.E_id= @ExamID
	group by Question_Type

	return
end

--Test 
select * from GetExamQus(201)
-------------------------------------------------------------------------------------------------------------------
--- Fuction_7
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
--- Fuction_8
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
--- Fuction_9
--- function GetQuestsAns to the get all info about the Question and it's answers, and to get the result you must enter param Question_ID

CREATE or alter FUNCTION GetQuestsAns(@Q_id INT)
RETURNS TABLE
AS
RETURN (
    SELECT q.* , Answer_Status, Ans_Txt
	FROM question q inner join Answer a on a.Question_iD= q.Question_iD
    where q.Question_iD= @Q_id
)

--Test 
select * from GetQuestsAns(301)
-------------------------------------------------------------------------------------------------------------------
--- Fuction_10
--- function GetExamInst to the get the instractor name who has been put a spasifice exam, and to get the result
--  you must enter params Exam_ID and instractor_id

CREATE or alter FUNCTION GetExamInst(@E_id int, @inst_id INT)
RETURNS TABLE
AS
RETURN (
    SELECT IE.E_ID Exam_ID, IE.Inst_ID Inst_ID, U.User_Name InstName
	FROM Instructor_Exam IE inner join Instructor I on IE.Inst_ID= I.User_ID
	     inner join users U on I.User_ID = U.User_ID
    where IE.E_id= @E_id and IE.Inst_ID = @inst_id
)

--Test 
select * from GetExamInst(201,100)
-------------------------------------------------------------------------------------------------------------------
--- Fuction_11
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
--- Fuction_12
--- function GetTrackCourses to get all coures in the track, and to get the result you must enter param courseID
--- branches intakes
create or alter function GetBranchIntaks(@Branch_Id int)
returns table
as
return(
       select B.Branch_Name, t.Intake_name, t.Mng_ID
	   from Branch B
	   inner join Intake t on b.Year= t.Year
	   where b.Branch_ID= @Branch_Id
)

--Test 
select * from GetBranchIntaks(200)






