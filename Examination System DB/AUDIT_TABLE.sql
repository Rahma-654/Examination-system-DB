------------Auditing for user Table-------------
create table user_audit
(
deleted_user_id int,
inserted_user_id int,
username varchar(max),
date datetime,
deleted_user_name varchar(55),
inserted_user_name varchar(55),
deleted_gender char(1),
inserted_gender char(1),
deleted_phone char(11),
inserted_phone char(11),
deleted_city varchar(20),
inserted_city varchar(20),
deleted_street varchar(20),
inserted_street varchar(20),
deleted_password varchar(55),
inserted_password varchar(55),
deleted_email varchar(55),
inserted_email varchar(55),
deleted_role varchar(22),
inserted_role varchar(22)
)


------------Auditing for student Table-------------
create table student_audit
(
username varchar(max),
date datetime,
deleted_user_id int,
inserted_user_id int
)


------------Auditing for instructor Table-------------
create table instructor_audit
(
username varchar(max),
date datetime,
deleted_user_id int,
inserted_user_id int
)



------------Auditing for Manager Table-------------
create table train_manager_audit
(
username varchar(max),
date datetime,
deleted_user_id int,
inserted_user_id int
)



------------Auditing for course Table-------------
create table Course_audit
(
deleted_crs_id int,
inserted_crs_id int,
username varchar(max),
date datetime,
deleted_crs_name varchar(33),
inserted_crs_name varchar(33),
deleted_description varchar(100),
inserted_description varchar(100),
deleted_min_degree int,
inserted_min_degree int,
deleted_max_degree int,
inserted_max_degree int
)


------------Auditing for branch Table-------------
create table branch_audit
(
deleted_branch_id int,
inserted_branch_id int,
username varchar(max),
date datetime,
deleted_branch_name varchar(50),
inserted_branch_name varchar(50),
deleted_year int,
inserted_year int
)


------------Auditing for exam table-------------
create table exam_audit
(
deleted_exam_id int,
inserted_exam_id int,
username varchar(max),
date datetime,
deleted_crs_id varchar(50),
inserted_crs_id varchar(50),
deleted_starttime datetime,
inserted_starttime datetime,
deleted_endtime datetime,
inserted_endtime datetime,
)

------------Auditing for student-exam table-------------
create table student_exam_audit
(
deleted_std_id int,
inserted_std_id int,
username varchar(max),
date datetime,
deleted_exam_id int,
inserted_exam_id int,
deleted_std_grade int,
inserted_std_grade int,
deleted_std_answer varchar(300),
inserted_std_answer varchar(300)
)


------------Auditing for track table-------------
create table track_audit
(
deleted_track_id int,
inserted_track_id int,
username varchar(max),
date datetime,
deleted_track_name varchar(300),
inserted_track_name varchar(300),
deleted_dept_id int,
inserted_dept_id int
)


------------Auditing for question table-------------
create table question_audit
(
deleted_question_id int,
inserted_question_id int,
username varchar(max),
date datetime,
deleted_question_txt varchar(300),
inserted_question_txt varchar(300),
deleted_question_grade int,
inserted_question_grade int,
deleted_question_type varchar(30),
inserted_question_type varchar(30),
deleted_crs_id int,
inserted_crs_id int
)


------------Auditing for student-department-intake table-------------
create table student_department_intake_audit
(
deleted_std_id int,
inserted_std_id int,
username varchar(max),
date datetime,
deleted_track_id int,
inserted_track_id int,
deleted_year int,
inserted_year int
)


------------Auditing for Answer table-------------
create table answer_audit
(
deleted_answer_id int,
inserted_answer_id int,
username varchar(max),
date datetime,
deleted_answer_status char(1),
inserted_answer_status char(1),
deleted_question_id int,
inserted_question_id int
)





------------Auditing for department table-------------
create table department_audit
(
deleted_department_id int,
inserted_department_id int,
username varchar(max),
date datetime,
deleted_department_name varchar(30),
inserted_department_name varchar(30)
)


------------Auditing for course-track table-------------
create table course_track_audit
(
deleted_crs_id int,
inserted_crs_id int,
username varchar(max),
date datetime,
deleted_track_id int,
inserted_track_id int
)


------------Auditing for intake table-------------
create table intake_audit
(
deleted_year int,
inserted_year int,
username varchar(max),
date datetime,
deleted_intake_name varchar(50),
inserted_intake_name varchar(50),
deleted_mng_id int,
inserted_mng_id int
)


------------Auditing for department-branch table-------------
create table department_branch_audit
(
deleted_dept_id int,
inserted_dept_id int,
username varchar(max),
date datetime,
deleted_branch_id int,
inserted_branch_id int
)



------------Auditing for exam-question table-------------
create table exam_question_audit
(
deleted_exam_id int,
inserted_exam_id int,
username varchar(max),
date datetime,
deleted_question_id int,
inserted_question_id int
)


------------Auditing for instructor-course table-------------
create table instructor_course_audit
(
deleted_crs_id int,
inserted_crs_id int,
username varchar(max),
date datetime,
deleted_inst_id int,
inserted_inst_id int,
deleted_year int,
inserted_year int
)

------------Auditing for instructor-exam table-------------
create table instructor_exam_audit
(
deleted_exam_id int,
inserted_exam_id int,
username varchar(max),
date datetime,
deleted_inst_id int,
inserted_inst_id int
)


------------Auditing for student_exam total grade table-------------
create table student_exam_total_grade_audit
(
deleted_std_id int,
inserted_std_id int,
username varchar(max),
date datetime,
deleted_exam_id int,
inserted_exam_id int,
deleted_total_grade int,
inserted_total_grade int
)

