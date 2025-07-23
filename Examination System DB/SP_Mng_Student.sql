CREATE or alter PROCEDURE sp_Mng_addStudent
	@Us_ID int,
	@std_name varchar(50),
	@std_Gender char(1),
	@std_phone varchar(11),
	@std_City varchar(20),
	@std_st varchar(20),
	@std_pass varchar(55),
	@std_mail varchar(55),
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
	where @MnguserID=t.User_ID
	IF @t ='training manager'
	AND @password = @p
	BEGIN
		insert into Users
		values(@Us_ID,@std_name,@std_Gender,@std_phone,@std_City,@std_st,@std_pass,@std_mail,'student')
		insert into Student
		values(@Us_ID)
	end
	ELSE 
		PRINT 'The user name or password is incorrect'
END

exec sp_Mng_addStudent 6,'mahinar','f','01144114414','tanta','hila','pass876','dfd@fdf.df',3,'pass789'
go
CREATE or alter PROCEDURE sp_Mng_asssignStduent_track_intake
	@std_ID int,
	@track_id int,
	@year int,
	@MnguserID int,
	@password NVARCHAR(30)
AS
BEGIN
	declare @t char(22),@p varchar(55),@mID int
	select @t=u.Role ,@p=u.Password,@mID=t.[User_ID],@year=i.year
	from Users u
	join Train_Manager t
	on u.[User_ID]=t.[User_ID]
	join Intake i
	on i.Mng_ID=t.[User_ID]
	where @MnguserID=u.User_ID
	IF @t ='training manager'
	AND @password = @p
	BEGIN
		insert into student_debartment_intake
		values(@std_ID,@track_id,@year)
	end
	ELSE 
		PRINT 'The user name or password is incorrect'
END

exec sp_Mng_asssignStduent_track_intake 1,100,2025,3,'pass789'
go
CREATE or alter PROCEDURE sp_Mng_editeStduent_track_intake
	@std_oldID int,
	@std_newID int,
	@track_oldid int,
	@track_newid int,
	@yearold int,
	@yearnew int,
	@MnguserID int,
	@password NVARCHAR(30)
AS
BEGIN
	declare @t char(22),@p varchar(55),@mID int
	select @t=u.Role ,@p=u.Password,@mID=t.User_ID
	from Users u
	join Train_Manager t
	on u.User_ID=t.User_ID
	join Intake i
	on i.Mng_ID=t.User_ID
	where @MnguserID=u.User_ID
	IF @t ='training manager'
	AND @password = @p
	BEGIN
		update student_debartment_intake
		set Std_ID=@std_newID,track_id=@track_newid,year=@yearnew
		where Std_ID=@std_oldID and track_id=@track_oldid and year=@yearold
	end
	ELSE 
		PRINT 'The user name or password is incorrect'
END

exec sp_Mng_editeStduent_track_intake 1,6,100,100,2025,2025,3,'pass789'
go
CREATE or alter PROCEDURE sp_Mng_editStudentData
	@Us_ID int,
	@std_name varchar(50),
	@std_Gender char(1),
	@std_phone varchar(11),
	@std_City varchar(20),
	@std_st varchar(20),
	@std_mail varchar(55),
	@MnguserID int,
	@password NVARCHAR(30)
AS
BEGIN
	declare @t char(22),@p varchar(55),@mID int,@year int 
	select @t=u.Role ,@p=u.Password,@mID=t.User_ID
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
		set [User_Name]=@std_name,Gender=@std_Gender,Phone=@std_phone,City=@std_City,Street=@std_st
		,EMail=@std_mail
		where [User_ID]=@Us_ID
	end
	ELSE 
		PRINT 'The user name or password is incorrect'
END

exec sp_Mng_editStudentData 4,'Zakria','m','01277412583','difna','edded','ewf@fdg.dyr',3,'pass789'


go
CREATE or alter PROCEDURE sp_Mng_deleteStudentData

	@std_Id int,
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
		delete from student_debartment_intake
		where @std_Id=Std_ID
		delete from Student
		where @std_Id=[User_ID] 
		delete from Users 
		where @std_ID=[User_ID]
	end
	ELSE 
		PRINT 'The user name or password is incorrect'
END

exec sp_Mng_deleteStudentData 6,3,'pass789'