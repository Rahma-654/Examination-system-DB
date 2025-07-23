
create or alter proc sp_calcstdgrade
@stdid int,
@eid int

as
	begin
		declare @ch int =0
			select @ch=count(*)
			from EXAM_STUDENT
			where @stdid=STD_ID
			and   @eid=E_id

			if @ch>=1
			begin
						declare @tgrade int
						select @tgrade=sum(q.Question_grade)
						from Exam_Question eq
						join Answer a
						on eq.Question_iD=a.Question_iD
						join EXAM_STUDENT es
						on es.std_Answer=a.Ans_txt
						join question q
						on q.Question_iD=eq.Question_iD
						insert into Student_Exam_Total_Grade(Student_ID,E_ID,Total_Grade)
						values (@stdid,@eid,@tgrade)
			end
	end

	exec sp_calcstdgrade 1,1














