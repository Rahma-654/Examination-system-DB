
CREATE or alter PROCEDURE sp_Mng_addintake

	@intakeName VARCHAR(50),
	@userID VARCHAR(55),
	@password VARCHAR(55) 
AS
BEGIN
	declare @t char(22),@p varchar(55),@mID int 
	select @t=u.Role ,@p=u.Password,@mID=t.User_ID
	from Users u
	join Train_Manager t
	on u.User_ID=t.User_ID
	where @userID=u.[User_ID]
	if @t='training manager'
	AND  @p=@password 
	BEGIN
		INSERT INTO Intake
		VALUES (year(getdate()),@intakeName,@mID)
	END
	ELSE
	PRINT 'The user name or password is incorrect'
END

EXEC sp_Mng_addintake 
	@intakeName = 'intake 33',
	@userID = 3,
	@password = 'pass789'

go
CREATE or alter PROCEDURE sp_Mng_editintakes
	@oldName VARCHAR(60),
	@newName VARCHAR(60),
	@userID int,
	@password VARCHAR(30)
AS
BEGIN
	declare @t char(22),@p varchar(55),@mID int 
	select @t=u.Role ,@p=u.Password,@mID=t.User_ID
	from Users u
	join Train_Manager t
	on u.User_ID=t.User_ID
	where @userID=u.[User_ID]
	IF @t ='training manager'
	AND @password = @p
	BEGIN
		UPDATE Intake
		SET Intake_name = @newName
		WHERE Intake_name = @oldName
	END
	ELSE 
		PRINT 'The user name or password is incorrect'
END
EXEC sp_Mng_editintakes 
	@oldName = 'intake 33',
	@newName = 'intake 35',
	@userID = 3,
	@password = 'pass789'
go

CREATE PROCEDURE sp_Mng_deleteintake
	@name VARCHAR(60),
	@userID int,
	@password NVARCHAR(30)
AS
BEGIN
	declare @t char(22),@p varchar(55),@mID int 
	select @t=u.Role ,@p=u.Password,@mID=t.User_ID
	from Users u
	join Train_Manager t
	on u.User_ID=t.User_ID
	where @userID=u.[User_ID]
	IF @t ='training manager'
	AND @password = @p
	BEGIN
		DELETE FROM Intake
		WHERE Intake_name = @name
	END
	ELSE 
		PRINT 'The user name or password is incorrect'
END
EXEC sp_Mng_deleteintake 
	@name = 'intake 35',
	@userID = 3,
	@password = 'pass789
	
	'