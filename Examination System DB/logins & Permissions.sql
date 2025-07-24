---Create longins and Passwordes for different users
CREATE LOGIN Sara WITH PASSWORD = 'pass123';
CREATE LOGIN Ali WITH PASSWORD = 'pass456';
CREATE LOGIN Hassan WITH PASSWORD = 'pass789';
CREATE LOGIN AdminSys WITH PASSWORD = 'Admin123';

------Create users Permissions for different users
CREATE USER Sara FOR LOGIN Sara;
CREATE USER Ali FOR LOGIN Ali;
CREATE USER Hassan FOR LOGIN Hassan;
CREATE USER AdminSys FOR LOGIN AdminSys;

---Giving the Admin `db_owner` permissions (full control over the database).
Exec sp_addrolemember 'db_owner', 'AdminSys';


--- Grant SELECT, INSERT ON tables(Answer, Exam, Exam_student and qustion) TO student Sara
GRANT select on Exam to Sara;
GRANT select on question to Sara;
GRANT select, insert, update on EXAM_STUDENT to Sara;
GRANT select on Student_Exam_Total_Grade to Sara;



--- Grant SELECT, INSERT, update ON tables(Answer, Exam, Exam_student, qustion, Course, EXAM_QUESSTION and
---      Instractor_Exam) TO instractor Ali
GRANT select on Instructor_Course to Ali;
GRANT select on Course to Ali;
GRANT select on Student_Exam_Total_Grade to Ali;
GRANT select, insert, update on Exam_Question to Ali;
GRANT select, insert, update on Answer to Ali;
GRANT select, insert, update on Exam to Ali;
GRANT select, insert, update on Exam_Student to Ali;
GRANT select, insert, update on Question to Ali;
GRANT insert on Instractor_Exam to Ali;



--- Grant SELECT, INSERT, update ON tables(Department, branch, Dept_branch, Dept_track, Intake, Student, track and
---      student_department_intake) TO Training Manager Hassan
GRANT select, insert, update on Department to Hassan;
GRANT select, insert, update on Branch to Hassan;
GRANT select, insert, update on Dept_branch to Hassan;
GRANT select, insert, update on Intake to Hassan;
GRANT select, insert, update on Student to Hassan;
GRANT select, insert, update on Track to Hassan;
GRANT select, insert, update on student_department_intake to Hassan;


