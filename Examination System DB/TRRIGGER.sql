-----------------trigger for users table--------------
create or alter trigger trg_user_audit
on users
after update , delete , insert
as
if (GETDATE() between '2025-05-25 02:30:00' and '2026-03-30 00:00:00')
begin
	rollback
	print 'sorry, you can not add now'
end
else
	begin
insert into user_audit
select (select User_ID from deleted),(select User_ID from inserted),SUSER_NAME(),GETDATE()
,(select User_Name from deleted),(select User_Name from inserted),(select Gender from deleted)
,(select Gender from inserted),(select Phone from deleted),(select Phone from inserted),
(select City from deleted),(select City from inserted),(select Street from deleted),(select Street from inserted),
(select Password from deleted),(select Password from inserted),(select Email from deleted),(select Email from inserted),
(select Role from deleted),(select Role from inserted)
	end




----------------------trigger for instructor table------------
create trigger trg_instructor
on Instructor
after insert, update
as
declare @role varchar(50)
select @role=users.Role from inserted,Users where Users.User_ID=inserted.User_ID
if (@role != 'instructor')
begin
print 'sorry that is a wrong id'
rollback
end




----------------------instructor audit table------------
create or alter trigger trg_instructor_audit
on Instructor
after insert, update, delete
as
insert into instructor_audit
select SUSER_NAME(),GETDATE(),(select User_ID from deleted),(select User_ID from inserted)



insert into Instructor
values(3)
update Instructor
set User_ID=4

----------------------trigger for student table------------
create trigger trg_student
on Student
after insert, update
as
declare @role varchar(50)
select @role=users.Role from inserted,Users where Users.User_ID=inserted.User_ID
if (@role != 'student')
begin
print 'sorry that is a wrong id'
rollback
end



----------------------audit table instructor------------
create or alter trigger trg_student_audit
on Student
after insert, update, delete
as
insert into student_audit
select SUSER_NAME(),GETDATE(),(select User_ID from deleted),(select User_ID from inserted)



----------------------trigger for train_manager table------------
create trigger trg_manager
on train_manager
after insert, update
as
declare @role varchar(50)
select @role=users.Role from inserted,Users where Users.User_ID=inserted.User_ID
if (@role != 'training manager')
begin
print 'sorry that is a wrong id'
rollback
end




----------------------audit table train_manager------------
create trigger trg_train_manager_audit
on train_manager
after insert, update, delete
as
insert into train_manager_audit
select SUSER_NAME(),GETDATE(),(select User_ID from deleted),(select User_ID from inserted)





----------------------trigger for Question audit table------------
create or alter trigger trg_question_audit
on question
after update , delete , insert
as
insert into question_audit
select (select Question_iD from deleted),(select Question_iD from inserted),SUSER_NAME(),GETDATE()
,(select Question_txt from deleted),(select Question_txt from inserted),(select Question_grade from deleted)
,(select Question_grade from inserted),(select Question_Type from deleted),(select Question_Type from inserted),
(select Crs_id from deleted),(select Crs_id from inserted)






----------------------trigger for Answer table------------
create or alter trigger trg_answer_audit
on Answer
after update , delete , insert
as 
insert into answer_audit
select (select answer_iD from deleted),(select answer_iD from inserted),SUSER_NAME(),getdate(),
(select Answer_Status from deleted),(select answer_status from inserted),(select Question_iD from deleted),
(select Question_iD from inserted)



-------------trigger that validate one correct answer only in choice and mcq----------
create or alter trigger trg_answer
on Answer
after update , insert
as
declare @x int
select * from Answer
where Question_ID=(select Question_ID from inserted) and Answer_Status=1
select @x=@@ROWCOUNT
if (@x=2)
begin 
print 'sorry you should put one answer correct only in a one question'
rollback
end





----------------------trigger for department audit table------------
create or alter trigger trg_department_audit
on department
after update , delete , insert
as
if (GETDATE() between '2025-05-25 02:48:00' and '2026-03-30 00:00:00')
begin
	rollback
	print 'sorry, you can not add now'
end
else
	begin
insert into department_audit
select (select debartment_id from deleted),(select debartment_id from inserted),SUSER_NAME(),getdate(),
(select debartment_name from deleted),(select debartment_name from inserted)
	end





---------Trigger for course table tracking updating crs_name--------
create or alter trigger trg_course_audit
on Course
after update, insert, delete
as
insert into Course_audit
select (select Crs_id from deleted), (select Crs_id from inserted), SUSER_NAME(),GETDATE(),
(select crs_name from deleted), (select crs_name from inserted),
(select Describtion from deleted), (select Describtion from inserted),
(select min_degree from deleted), (select min_degree from inserted),
(select max_degree from deleted), (select max_degree from inserted)






---------Trigger for course table tracking updating crs_name--------
create or alter trigger trg_branch_audit
on branch
after delete, insert , update
as
if (GETDATE() between '2025-05-25 02:48:00' and '2026-03-30 00:00:00')
begin
	rollback
	print 'sorry, you can not add now'
end
else
	begin
insert into branch_audit
select (select branch_id from deleted),(select branch_id from inserted),SUSER_NAME(),GETDATE(),
(select branch_name from deleted),(select branch_name from inserted),
(select year from deleted),(select year from inserted)
	end





----------------------trigger for exam audit table------------
create or alter trigger trg_exam_audit
on EXAM
after update , delete , insert
as
insert into exam_audit
select (select E_id from deleted),(select E_id from inserted),SUSER_NAME(),GETDATE()
,(select Crs_id from deleted),(select Crs_id from inserted),(select start_time from deleted)
,(select start_time from inserted),(select end_time from deleted),(select end_time from inserted)






----------------------trigger for student_exam audit table------------
create or alter trigger trg_student_exam_audit
on EXAM_STUDENT
after update , delete , insert
as
insert into student_exam_audit
select (select STD_ID from deleted),(select STD_ID from inserted),SUSER_NAME(),GETDATE()
,(select E_id from deleted),(select E_id from inserted),(select std_grade from deleted)
,(select std_grade from inserted),(select std_Answer from deleted),(select std_Answer from inserted)






----------------------trigger for track audit table------------
create or alter trigger trg_track_audit
on track
after update , delete , insert
as
if (GETDATE() between '2025-05-25 02:48:00' and '2026-03-30 00:00:00')
begin
	rollback
	print 'sorry, you can not add any data because the intake is opened already'
end
else
	begin
insert into track_audit
select (select track_id from deleted),(select track_id from inserted),SUSER_NAME(),GETDATE()
,(select track_name from deleted),(select track_name from inserted),(select Dept_ID from deleted)
,(select Dept_ID from inserted)
	end







----------------------trigger for student_department_intake audit table------------
create or alter trigger trg_student_department_intake_audit
on student_debartment_intake
after update , delete , insert
as
insert into student_department_intake_audit
select (select Std_ID from deleted),(select Std_ID from inserted),SUSER_NAME(),GETDATE()
,(select track_id from deleted),(select track_id from inserted),(select year from deleted)
,(select year from inserted)





----------------------trigger for course_track audit table------------
create or alter trigger trg_course_track_audit
on COURSE_TRACK
after update , delete , insert
as
insert into course_track_audit
select (select Crs_id from deleted),(select Crs_id from inserted),SUSER_NAME(),getdate(),
(select track_id from deleted),(select track_id from inserted)






----------------------trigger for department_branch audit table------------
create or alter trigger trg_department_branch_audit
on Debt_branch
after update , delete , insert
as
insert into department_branch_audit
select (select department_id from deleted),(select department_id from inserted),SUSER_NAME(),GETDATE(),
(select branch_id from deleted),(select branch_id from inserted)





----------------------trigger for exam_question audit table------------
create or alter trigger trg_exam_question_audit
on EXAM_QUESTION
after update , delete , insert
as
insert into exam_question_audit
select (select E_id from deleted),(select E_id from inserted),SUSER_NAME(),GETDATE(),
(select Question_iD from deleted),(select Question_iD from inserted)





----------------------trigger for instructor_course audit table------------
create or alter trigger trg_instructor_course_audit
on instructor_Course
after update , delete , insert
as
insert into instructor_course_audit
select (select Crs_id from deleted),(select Crs_id from inserted),SUSER_NAME(),getdate(),
(select Inst_ID from deleted),(select Inst_ID from inserted),
(select year from deleted),(select year from inserted)





----------------------trigger for instructor_exam audit table------------
create or alter trigger trg_instructor_exam_audit
on instructor_Exam
after update , delete , insert
as
insert into instructor_exam_audit
select (select E_id from deleted),(select E_id from inserted),SUSER_NAME(),getdate(),
(select Inst_ID from deleted),(select Inst_ID from inserted)




----------------------trigger for intake table------------
create or alter trigger trg_prevent_entering_data_in_intake_time
on intake
after insert , update , delete 
as
if (GETDATE() between '2025-05-25 02:48:00' and '2026-03-30 00:00:00')
begin
	rollback
	print 'sorry, you can not add now'
end
else
	begin
insert into intake_audit
select (select year from deleted),(select year from inserted),SUSER_NAME(),GETDATE(),
(select Intake_name from deleted),(select Intake_name from inserted),(select Mng_ID from deleted),
(select Mng_ID from inserted)
	end




----------------------trigger for instructor_exam audit table------------
create or alter trigger trg_student_exam_total_grade_audit
on student_exam_total_grade
after update , delete , insert
as
insert into student_exam_total_grade_audit
select (select Student_ID from deleted),(select Student_ID from inserted),SUSER_NAME(),getdate(),
(select Exam_ID from deleted),(select Exam_ID from inserted),(select Total_Grade from deleted),
(select Total_Grade from inserted)