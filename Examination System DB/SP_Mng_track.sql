CREATE or alter PROCEDURE sp_Mng_addTrack
	@track_name VARCHAR(30),
	@track_ID int,
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
		insert into track
		values (@track_ID,@track_name,@Dept_ID)
	end
	ELSE 
		PRINT 'The user name or password is incorrect'
	END
 exec sp_Mng_addTrack '.net',101,1,3,'pass789'
 go
go
CREATE or alter PROCEDURE sp_Mng_deleteTrack
	@Track_ID int,
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
		delete from student_debartment_intake
		where track_id=@Track_ID
		delete from track
		where track_id=@Track_ID
	end
	ELSE 
		PRINT 'The user name or password is incorrect'
END

exec sp_Mng_deleteTrack 101,3,'pass789'
go
CREATE or alter PROCEDURE sp_Mng_editeTrack
	@Track_ID int,
	@Track_newname varchar(30),
	@Dept_newid int,
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
		update track
		set track_name=@Track_newname,Dept_ID=@Dept_newid
		where track_id=@Track_ID
	end
	ELSE 
		PRINT 'The user name or password is incorrect'
END

exec sp_Mng_editeTrack 100,'Fullstack',1, 3,'pass789'