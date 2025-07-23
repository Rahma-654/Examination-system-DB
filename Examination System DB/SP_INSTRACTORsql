create or alter proc Ins_AddQuestion_SP
@QID int,
@QTXT varchar(60),
@QGrade int,
@Qtype varchar(30),
@CID int,
@InstID int
as
begin
	declare @ch int
	select @CH=count(*)
	from Instructor_Course ic
	where @InstID=Inst_ID and @CID=Crs_id
	if @ch>=1
		begin
			insert into question
			values(@QID,@QTXT,@QGrade,@Qtype,@CID)
			print 'question added'
		end
	else
		begin
			print 'not access'
		end
end

exec Ins_AddQuestion_SP 305,'sql standared query language',2,'T/F',200,2
go
create or alter proc Ins_EditQuestion_SP
@QID int,
@Qtxt varchar(60),
@Qgrade int,
@Qtype varchar(30),
@CID int,
@InstID int
as
begin
	declare @ch int,@chQ int
	select @CH=count(*)
	from Instructor_Course
	where @InstID=Inst_ID and @CID=Crs_id
	select @chQ=count(*)
	from question
	where Question_iD=@QID
	if @ch>=1 and @chQ>=1
		begin
			update question
			set Question_grade=@Qgrade,Question_txt=@Qtxt,Question_Type=@Qtype,Crs_id=@CID
			where Question_iD=@QID
			print 'question Updated'
		end
	else
		begin
			print 'not access or Question id is not correct'
		end
end

exec Ins_EditQuestion_SP 305,'MongoDB is RDBMS',2,'T/F',200,2

go
create or alter proc Ins_DeletQuestion_SP
@QID int,
@CID int,
@InstID int
as
begin
	declare @ch int,@chQ int
	select @CH=count(*)
	from Instructor_Course
	where @InstID=Inst_ID and @CID=Crs_id
	select @chQ=count(*)
	from question
	where Question_iD=@QID
	if @ch>=1 and @chQ>=1
		begin
			delete from Answer
			where Question_iD=@QID
			delete from Exam_Question
			where Question_iD=@QID
			delete from question
			where Question_iD=@QID
			
			print 'question deleted'
		end
	else
		begin
			print 'not access or Question id is not correct'
		end
end

exec Ins_DeletQuestion_SP 302,200,2
 go
 create or alter proc Ins_SelectQuestionManualy_SP
 @QID int,
 @Ins_ID int,
 @CID int
 as
 begin
	declare @ch int =0
	select @ch=count(*)
	from Instructor_Course
	where Inst_ID=@Ins_ID
	and	  Crs_id=@CID
	and   year=year(GETDATE())

	if(@ch>=1)
		begin
			select Question_txt
			from question
			where question_iD=@QID
		end
	else
		begin
			print 'no access'
		end
 end

 exec Ins_SelectQuestionManualy_SP 303,2,200
 go
 
 create or alter proc Ins_SelectQuestionRandomtype_SP
 @Q_Type varchar(30),
 @Ins_ID int,
 @CID int
 as
 begin
	declare @ch int =0
	select  @ch=count(*)
	from Instructor_Course ic
	join question q
	on q.Crs_id=ic.Crs_id
	where ic.Inst_ID=@Ins_ID
	and	  ic.Crs_id=@CID
	and   ic.year=year(GETDATE())
	and   @Q_Type=q.Question_Type
	if @ch>=1
		begin
			DECLARE @Question_txt NVARCHAR(60)
			SELECT TOP 1
				@Question_txt = Question_txt
			FROM question
			where @Q_Type=Question_Type
			ORDER BY NEWID()  
			select Question_txt,Question_Type,Question_grade
			from question
			where @Question_txt=Question_txt
		end
	else
		begin
			print ' not access or error in input'
		end
 end

 exec Ins_SelectQuestionRandomtype_SP 'T/F',2,200

-----------------------do not assign type
go
create or alter proc Ins_SelectQuestionRandom_SP
 @Ins_ID int,
 @CID int
 as
 begin
	declare @ch int =0
	select  @ch=count(*)
	from Instructor_Course ic
	join question q
	on q.Crs_id=ic.Crs_id
	where ic.Inst_ID=@Ins_ID
	and	  ic.Crs_id=@CID
	and   ic.year=year(GETDATE())
	if @ch>=1
		begin
			DECLARE @Question_txt NVARCHAR(60)
			SELECT TOP 1
				@Question_txt = Question_txt
			FROM question
			ORDER BY NEWID()  
			select Question_txt,Question_Type,Question_grade
			from question
			where @Question_txt=Question_txt
		end
	else
		begin
			print ' not access or error in input'
		end
 end

 exec Ins_SelectQuestionRandom_SP 2,200


