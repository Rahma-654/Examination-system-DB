CREATE PROCEDURE sp_Mng_addBranch
	@Br_name VARCHAR(60),
	@Br_ID int,
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
		insert into branch
		values (@Br_ID,@Br_name,@year)
	end
	ELSE 
		PRINT 'The user name or password is incorrect'
END

exec sp_Mng_addBranch 'Alexandria',20,3,'pass789'
go
CREATE or alter PROCEDURE sp_Mng_editBranch
	@Br_oldname VARCHAR(60),
	@Br_newname VARCHAR(60),
	@Br_oldID int,
	@Br_newID int,
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
		update branch
		set branch_id=@Br_newID ,branch_name=@Br_newname
		where branch_id=@Br_oldID
	end
	ELSE 
		PRINT 'The user name or password is incorrect'
END

exec sp_Mng_editBranch 'Alexandria','New Valley',20,30,3,'pass789'
go

CREATE or alter PROCEDURE sp_Mng_deleteBranch
	@Br_ID int,
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
		delete from Debt_branch
		where branch_id=@Br_ID
		delete from branch
		where branch_id=@Br_ID
	end
	ELSE 
		PRINT 'The user name or password is incorrect'
END

exec sp_Mng_deleteBranch 30,3,'pass789'

