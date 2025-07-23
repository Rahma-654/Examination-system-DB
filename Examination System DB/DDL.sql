
-----------------------table users-------------------------------------
CREATE TABLE Users (
    User_ID INT PRIMARY KEY,
    User_Name VARCHAR(55),
    Gender CHAR(1) NOT NULL CHECK (Gender IN ('m', 'f')),
    Phone VARCHAR(11) CHECK (LEN(Phone) = 11 AND Phone LIKE '01[0125]%'),
    City VARCHAR(20),
    Street VARCHAR(20),
    Password VARCHAR(55),
    Email VARCHAR(55) CHECK (Email LIKE '_%@_%._%'),
    Role CHAR(22) NOT NULL CHECK (Role IN ('student', 'instructor', 'training manager'))
) ON users_FG
---------------------------TABLE Instructor------------------------------------

CREATE TABLE Instructor (
    User_ID INT PRIMARY KEY,
    CONSTRAINT FK_Instructor_UserId FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
) ON users_FG

-------------------------TABLE Student----------------------------
CREATE TABLE Student (
    User_ID INT PRIMARY KEY,
    CONSTRAINT FK_Student_UserId FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
) ON users_FG

--------------------------TABLE Train_Manager------------------------
CREATE TABLE Train_Manager (
    User_ID INT PRIMARY KEY,
    CONSTRAINT FK_Train_Manager_UserId FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
) ON users_FG

---------------------------TABLE Intake----------------------------

CREATE TABLE Intake (
    Year INT PRIMARY KEY,
    Intake_name VARCHAR(50),
    Mng_ID INT,-------------->>>>>>>>>..from user ID in Manager
    CONSTRAINT FK_Intake_Mng_ID FOREIGN KEY (Mng_ID) REFERENCES Train_Manager(User_ID)
) ON users_FG

------------------------------TABLE Branch------------------------------
CREATE TABLE Branch (
    Branch_ID INT PRIMARY KEY,
    Branch_Name VARCHAR(50) CHECK (
        Branch_Name IN (
            'Alexandria','Aswan','Asyut','Beheira','Beni Suef',
            'Cairo','Dakahlia','Damietta','Fayoum','Gharbia',
            'Giza','Ismailia','Kafr El Sheikh','Luxor','Matrouh',
            'Minya','Monufia','New Valley','North Sinai','Port Said',
            'Qalyubia','Qena','Red Sea','Sharqia','Assuit','Sohag',
            'South Sinai','Suez'
        )
    ),
    Year INT,
    CONSTRAINT FK_Year_Branch FOREIGN KEY (Year) REFERENCES Intake(Year)
) ON branch_FG
-----------------------------TABLE Department---------------------------
CREATE TABLE Department (
    Debartment_ID INT PRIMARY KEY,
    Debartment_Name VARCHAR(30)
) ON branch_FG
---------------------------------------TABLE Track--------------------
CREATE TABLE Track (
    Track_ID INT PRIMARY KEY,
    Track_Name VARCHAR(30),
    Dept_ID INT NOT NULL,
    CONSTRAINT FK_DeptID_Track FOREIGN KEY (Dept_ID) REFERENCES Department(Debartment_ID)
) ON branch_FG
--------------------------------TABLE Debt_Branch--------------------
CREATE TABLE Debt_Branch (
    Department_ID INT NOT NULL,
    Branch_ID INT NOT NULL,
    CONSTRAINT FK_DebtBranch_H FOREIGN KEY (Department_ID) REFERENCES Department(Debartment_ID),
    CONSTRAINT FK_DebtBranch_B FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID),
    CONSTRAINT PK_Debt_Branch PRIMARY KEY (Department_ID, Branch_ID)
) ON branch_FG
-------------------------TABLE Course----------------------


create table Course
(
      Crs_id int primary key,
	  Crs_name varchar(33),
	  Describtion varchar(100),
	  min_degree int default 0,
	  max_degree int ,
	constraint ch_max_degree check(max_degree > min_degree),
	constraint ch_min_degree check(min_degree >= 0)
	  
)ON material_FG
----------------------TABLE Exam-----------------------
CREATE TABLE Exam (
    E_ID INT PRIMARY KEY,
    E_Type VARCHAR(33),
    Start_Time DATETIME NOT NULL,
    End_Time DATETIME NOT NULL,
    Total_Time INT DEFAULT 60,
    Crs_ID INT,
    CONSTRAINT FK_CrsExam FOREIGN KEY (Crs_ID) REFERENCES Course(Crs_ID),
	constraint ch_time_check check(End_Time > Start_Time)
)  ON material_FG
--------------------TABLE Question----------------------
CREATE TABLE Question (
    Question_ID INT PRIMARY KEY,
    Question_Txt VARCHAR(60) NOT NULL,
    Question_Grade INT NOT NULL,
    Question_Type VARCHAR(30) NOT NULL CHECK (Question_Type IN ('mcq', 'T/F', 'text')),
    Crs_ID INT,
    CONSTRAINT FK_CrsQuess FOREIGN KEY (Crs_ID) REFERENCES Course(Crs_ID)
) ON material_FG
--------------------TABLE Answer---------------------------
CREATE TABLE Answer (
    Answer_ID INT PRIMARY KEY,
    Answer_Status BINARY,
    Ans_Txt VARCHAR(300),
    Question_ID INT,
    CONSTRAINT FK_AnsQuess FOREIGN KEY (Question_ID) REFERENCES Question(Question_ID)
) ON material_FG
ALTER TABLE ANSWER 
ALTER COLUMN Answer_Status CHAR(1)

drop index IX_Answer_Status
------------------TABLE Instructor_Course--------------------
CREATE TABLE Instructor_Course (
    Crs_ID INT NOT NULL,
    Inst_ID INT NOT NULL, ------------->>>>>>> from  User_ID in Instructor
    Year INT NOT NULL,
    CONSTRAINT PK_Inst_Crs PRIMARY KEY (Crs_ID, Inst_ID, Year),
    CONSTRAINT FK_Instructor_CourseI FOREIGN KEY (Inst_ID) REFERENCES Instructor(User_ID),
    CONSTRAINT FK_Instructor_CourseC FOREIGN KEY (Crs_ID) REFERENCES Course(Crs_ID)
) ON material_FG

---------------------Instructor_Exam----------------------
CREATE TABLE Instructor_Exam (
    E_ID INT NOT NULL,
    Inst_ID INT NOT NULL,---------------->>>>>>from user ID in Instructor
    CONSTRAINT PK_Instructor_Exam PRIMARY KEY (E_ID, Inst_ID),
    CONSTRAINT FK_Instructor_Exam_E FOREIGN KEY (E_ID) REFERENCES Exam(E_ID),
    CONSTRAINT FK_Instructor_Exam_I FOREIGN KEY (Inst_ID) REFERENCES Instructor(User_ID)
) 
ON material_FG
--------------------------TABLE Exam_Question------------------
CREATE TABLE Exam_Question (
    E_ID INT NOT NULL,
    Question_ID INT NOT NULL,
    CONSTRAINT PK_Exam_Question PRIMARY KEY (E_ID, Question_ID),
    CONSTRAINT FK_Exam_Question_E FOREIGN KEY (E_ID) REFERENCES Exam(E_ID),
    CONSTRAINT FK_Exam_Question_Q FOREIGN KEY (Question_ID) REFERENCES Question(Question_ID)
) ON material_FG
---------------TABLE Course_Track-------------------
CREATE TABLE Course_Track (
    Crs_ID INT NOT NULL,
    Track_ID INT NOT NULL,
    CONSTRAINT PK_Course_Track PRIMARY KEY (Crs_ID, Track_ID),
    CONSTRAINT FK_Course_Track_C FOREIGN KEY (Crs_ID) REFERENCES Course(Crs_ID),
    CONSTRAINT FK_Course_Track_T FOREIGN KEY (Track_ID) REFERENCES Track(Track_ID)
) ON material_FG
----------------TABLE Exam_Student--------------
CREATE TABLE Exam_Student (
    E_ID INT NOT NULL,
    STD_ID INT NOT NULL,------------->>>>>>>>>>>from user ID in Student
    Std_Grade INT,
    Std_Answer VARCHAR(300),
    CONSTRAINT PK_Exam_Student PRIMARY KEY (E_ID, STD_ID),
    CONSTRAINT FK_Exam_Student_E FOREIGN KEY (E_ID) REFERENCES Exam(E_ID),
    CONSTRAINT FK_Exam_Student_S FOREIGN KEY (STD_ID) REFERENCES Student(User_ID) ON UPDATE CASCADE
) ON material_FG

-------------------TABLE Student_Track_Intake---------------------
CREATE TABLE student_debartment_intake (
    Std_ID INT NOT NULL,------------->>>>>>>>>>>from user ID in Student
    Track_ID INT NOT NULL,
    Year INT NOT NULL,
    CONSTRAINT PK_Student_Debartment_Intake PRIMARY KEY (Std_ID, Track_ID, Year),
    CONSTRAINT FK_Student_Debartment_IntakeI FOREIGN KEY (Std_ID) REFERENCES Student(User_ID),
    CONSTRAINT FK_Student_Debartment_IntakeT FOREIGN KEY (Track_ID) REFERENCES Track(Track_ID),
    CONSTRAINT FK_Student_Debartment_IntakeS FOREIGN KEY (Year) REFERENCES Intake(Year)
)ON material_FG
-------------------------table student_totalgrade----------------------
CREATE TABLE Student_Exam_Total_Grade (
    Student_ID INT NOT NULL,------------->>>>>>>>>>>from user ID in Student
     E_ID INT NOT NULL,------------->>>>>>>>>>>from user ID in EXAM
    Total_Grade INT NOT NULL,
    CONSTRAINT FK_Student_Exam_Grade_Student FOREIGN KEY (Student_ID) REFERENCES Student(User_ID),
	 CONSTRAINT FK_Student_Exam_TOTALGRADE FOREIGN KEY (E_ID) REFERENCES EXAM(E_ID),
    CONSTRAINT PK_Student_Exam_Grade PRIMARY KEY (Student_ID,  E_ID )
)ON material_FG

