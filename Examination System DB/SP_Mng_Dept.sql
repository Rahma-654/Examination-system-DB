CREATE or alter PROCEDURE sp_Mng_addDepartment
	@Dept_name VARCHAR(30),
	@Dept_ID int,
	@userID int,
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
	where @userID=u.[User_ID]
	IF @t ='training manager'
	AND @password = @p
	BEGIN
		insert into department
		values (@Dept_ID,@Dept_name)
	end
	ELSE 
		PRINT 'The user name or password is incorrect'
	END
 exec sp_Mng_addDepartment 'Software',2,3,'pass789'
 go
 CREATE or alter PROCEDURE sp_Mng_assignDepartment_branch
	@Dept_ID int,
	@br_ID int,
	@userID int,
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
	where @userID=u.[User_ID]
	IF @t ='training manager'
	AND @password = @p
	BEGIN
		insert into Debt_branch
		values (@Dept_ID,@br_ID)
	end
	ELSE 
		PRINT 'The user name or password is incorrect'
END
exec sp_Mng_assignDepartment_branch 2,50,3,'pass789'
exec sp_Mng_assignDepartment_branch 1,50,3,'pass789'
go
CREATE or alter PROCEDURE sp_Mng_deleteDepartment
	@Dept_ID int,
	@userID int,
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
	where @userID=u.[User_ID]
	IF @t ='training manager'
	AND @password = @p
	BEGIN
		delete from track
		where Dept_ID=@Dept_ID
		delete from  Debt_branch
		where department_id=@Dept_ID
		delete from department
		where debartment_id=@Dept_ID
	end
	ELSE 
		PRINT 'The user name or password is incorrect'
END

exec sp_Mng_deleteDepartment 2,3,'pass789'
go
CREATE or alter PROCEDURE sp_Mng_editeDepartment
	@Dept_ID int,
	@dept_newname varchar(30),
	@userID int,
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
	where @userID=u.[User_ID]
	IF @t ='training manager'
	AND @password = @p
	BEGIN
		update department
		set debartment_name=@dept_newname
		where debartment_id=@Dept_ID
	end
	ELSE 
		PRINT 'The user name or password is incorrect'
END

exec sp_Mng_editeDepartment 1,'HardWare',3,'pass789'