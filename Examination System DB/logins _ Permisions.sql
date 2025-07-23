CREATE LOGIN Msara WITH PASSWORD = 'pass123';
CREATE LOGIN Aali WITH PASSWORD = 'pass456';
CREATE LOGIN Yhassan WITH PASSWORD = 'pass789';

CREATE USER Msara FOR LOGIN Msara;
CREATE USER Aali FOR LOGIN Aali;
CREATE USER Yhassan FOR LOGIN Yhassan;


--- Grant SELECT, INSERT ON tables(Answer, Exam, Exam_student and qustion) TO student Msara
GRANT select on Exam to Msara;
GRANT select on question to Msara;
GRANT insert on Answer to Msara;
GRANT select on EXAM_STUDENT to Msara;



--- Grant SELECT, INSERT, update ON tables(Answer, Exam, Exam_student, qustion, Course, EXAM_QUESSTION and
---      Instractor_Exam) TO instractor Aali
GRANT select on Course to Aali;
GRANT select, insert, update on EXAM_QUESSTION to Aali;
GRANT select, insert, update on Answer to Aali;
GRANT select, insert, update on Exam to Aali;
GRANT select, insert, update on EXAM_STUDENT to Aali;
GRANT select, insert, update on question to Aali;
GRANT insert on Instractor_Exam to Aali;



--- Grant SELECT, INSERT, update ON tables(Department, branch, Dept_branch, Dept_track, Intake, Student, track and
---      student_department_intake) TO Training Manager Yhassan
GRANT select, insert, update on Department to Yhassan;
GRANT select, insert, update on branch to Yhassan;
GRANT select, insert, update on Dept_branch to Yhassan;
GRANT select, insert, update on Dept_track to Yhassan;
GRANT select, insert, update on Intake to Yhassan;
GRANT select, insert, update on Student to Yhassan;
GRANT select, insert, update on track to Yhassan;
GRANT select, insert, update on student_department_intake to Yhassan;


