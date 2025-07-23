CREATE or alter PROCEDURE sp_Mng_addInstructor
	@Ins_ID int,
	@ins_name varchar(50),
	@ins_Gender char(1),
	@ins_phone varchar(11),
	@ins_City varchar(20),
	@ins_st varchar(20),
	@ins_pass varchar(55),
	@ins_mail varchar(55),
	
	@MnguserID int,
	@password NVARCHAR(30)
AS
BEGIN
	declare @t char(22),@p varchar(55),@mID int,@year int 
	select @t=u.Role ,@p=u.Password,@mID=t.User_ID,@year=i.year
	from Users u
	join Train_Manager t
	on u.User_ID=t.User_ID
	join Intake i
	on i.Mng_ID=t.User_ID
	where @MnguserID=u.User_ID
	IF @t ='training manager'
	AND @password = @p
	BEGIN
		insert into Users
		values(@Ins_ID,@ins_name,@ins_Gender,@ins_phone,@ins_City,@ins_st,@ins_pass,@ins_mail,'instructor')
		insert into Instructor
		values(@Ins_ID)
	end
	ELSE 
		PRINT 'The user name or password is incorrect'
END

exec sp_Mng_addInstructor 10,'toqa','f','01012121454','hutghada','dfre','pass222','wer@dfs.rdy',3,'pass789'
go
CREATE or alter PROCEDURE sp_Mng_asssignInstructor_course
	@Ins_ID int,
	@crs_ID int,
	@year int,
	@MnguserID int,
	@password NVARCHAR(30)
AS
BEGIN
	declare @t char(22),@p varchar(55),@mID int
	select @t=u.Role ,@p=u.Password,@mID=t.User_ID,@year=i.year
	from Users u
	join Train_Manager t
	on u.User_ID=t.User_ID
	join Intake i
	on i.Mng_ID=t.User_ID
	where @MnguserID=u.User_ID
	IF @t ='training manager'
	AND @password = @p
	BEGIN
		insert into Instructor_Course
		values(@crs_ID,@Ins_ID,@year)
	end
	ELSE 
		PRINT 'The user name or password is incorrect'
END

exec sp_Mng_asssignInstructor_course 10,201,2025,3,'pass789'
go
CREATE or alter PROCEDURE sp_Mng_editenInstructor_course
	@Ins_oldID int,
	@Ins_newID int,
	@crs_oldID int,
	@crs_newID int,
	@year int,
	@MnguserID int,
	@password NVARCHAR(30)
AS
BEGIN
	declare @t char(22),@p varchar(55),@mID int
	select @t=u.Role ,@p=u.Password,@mID=t.User_ID,@year=i.year
	from Users u
	join Train_Manager t
	on u.User_ID=t.User_ID
	join Intake i
	on i.Mng_ID=t.User_ID
	where @MnguserID=u.[User_ID]
	IF @t ='training manager'
	AND @password = @p
	BEGIN
		update Instructor_Course
		set Crs_id=@crs_newID,Inst_ID=@Ins_newID
		where Inst_ID=@Ins_oldID and Crs_id=@crs_newID
	end
	ELSE 
		PRINT 'The user name or password is incorrect'
END

exec sp_Mng_editenInstructor_course 2,10,200,200,2025,3,'pass789'

go
CREATE or alter PROCEDURE sp_Mng_editInstructorData
	@Us_ID int,
	@ins_name varchar(50),
	@ins_Gender char(1),
	@ins_phone varchar(11),
	@ins_City varchar(20),
	@ins_st varchar(20),
	@ins_mail varchar(55),
	@MnguserID int,
	@password NVARCHAR(30)
AS
BEGIN
	declare @t char(22),@p varchar(55),@mID int,@year int 
	select @t=u.Role ,@p=u.Password,@mID=t.User_ID,@year=i.year
	from Users u
	join Train_Manager t
	on u.User_ID=t.User_ID
	join Intake i
	on i.Mng_ID=t.User_ID
	where @MnguserID=u.[User_ID]
	IF @t ='training manager'
	AND @password = @p
	BEGIN
		update Users
		set [User_Name]=@ins_name,Gender=@ins_Gender,Phone=@ins_phone,City=@ins_City,Street=@ins_st
		,EMail=@ins_mail
		where [User_ID]=@Us_ID
	end
	ELSE 
		PRINT 'The user name or password is incorrect'
END

exec sp_Mng_editInstructorData 9,'maraw','f','01277412583','difna','edded','ewf@fdg.dyr',3,'pass789'


go
CREATE or alter PROCEDURE sp_Mng_deleteInstructorData
	@ins_Id int,
	@MnguserID int,
	@password NVARCHAR(30)
AS
BEGIN
	declare @t char(22),@p varchar(55),@mID int,@year int 
	select @t=u.Role ,@p=u.Password,@mID=t.User_ID,@year=i.year
	from Users u
	join Train_Manager t
	on u.User_ID=t.User_ID
	join Intake i
	on i.Mng_ID=t.User_ID
	where @MnguserID=u.[User_ID]
	IF @t ='training manager'
	AND @password = @p
	BEGIN
		delete from Instructor_Course
		where @ins_Id=Inst_ID
		delete from Instructor_Exam
		where @ins_Id=Inst_ID
		delete from Instructor
		where @ins_Id=User_ID
		delete from Users
		where @ins_Id=User_ID
	end
	ELSE 
		PRINT 'The user name or password is incorrect'
END

exec sp_Mng_deleteInstructorData 10,3,'pass789'