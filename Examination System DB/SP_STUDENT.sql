create or alter proc sp_studentAnswer
@STDID int,
@QID int,
@ANSTXT varchar(300),
@EID int
as
begin
	declare @ch int =0
	select @ch=count(*)
	from Exam_Question
	where @QID=Question_iD
	and @EID=E_id
	if @ch>=1
		begin
			insert into EXAM_STUDENT(STD_ID,E_id,std_Answer)
			values(@STDID,@EID,@ANSTXT)
		end
end

exec sp_studentAnswer 1,300,'T',1
