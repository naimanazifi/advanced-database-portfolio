
-- MIT 8103: University Student Management System
-- Complete MySQL 8 Master Script
-- All sample records are fictional.

-- 1. DEPARTMENT
CREATE TABLE Department (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(100) NOT NULL UNIQUE,
    Office_Location VARCHAR(100)
) ENGINE=InnoDB;

-- 2. PROGRAMME
CREATE TABLE Programme (
    Programme_ID INT PRIMARY KEY,
    Programme_Name VARCHAR(100) NOT NULL,
    Degree_Level VARCHAR(50),
    Department_ID INT NOT NULL,
    FOREIGN KEY (Department_ID)
        REFERENCES Department(Department_ID)
) ENGINE=InnoDB;

-- 3. STUDENT
CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    Date_Of_Birth DATE,
    Admission_Year INT,
    Programme_ID INT NOT NULL,
    FOREIGN KEY (Programme_ID)
        REFERENCES Programme(Programme_ID)
) ENGINE=InnoDB;

-- 4. LECTURER
CREATE TABLE Lecturer (
    Lecturer_ID INT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    Department_ID INT NOT NULL,
    FOREIGN KEY (Department_ID)
        REFERENCES Department(Department_ID)
) ENGINE=InnoDB;

-- 5. COURSE
CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(100) NOT NULL,
    Credit_Units INT NOT NULL,
    Department_ID INT NOT NULL,
    CHECK (Credit_Units > 0),
    FOREIGN KEY (Department_ID)
        REFERENCES Department(Department_ID)
) ENGINE=InnoDB;

-- 6. SEMESTER
CREATE TABLE Semester (
    Semester_ID INT PRIMARY KEY,
    Semester_Name VARCHAR(50) NOT NULL,
    Academic_Year VARCHAR(9) NOT NULL,
    Start_Date DATE,
    End_Date DATE,
    CHECK (
        Start_Date IS NULL OR End_Date IS NULL
        OR End_Date >= Start_Date
    )
) ENGINE=InnoDB;

-- 7. COURSE OFFERING
CREATE TABLE Course_Offering (
    Offering_ID INT PRIMARY KEY,
    Course_ID INT NOT NULL,
    Lecturer_ID INT NOT NULL,
    Semester_ID INT NOT NULL,
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID),
    FOREIGN KEY (Lecturer_ID) REFERENCES Lecturer(Lecturer_ID),
    FOREIGN KEY (Semester_ID) REFERENCES Semester(Semester_ID)
) ENGINE=InnoDB;

-- 8. REGISTRATION
CREATE TABLE Registration (
    Registration_ID INT PRIMARY KEY,
    Student_ID INT NOT NULL,
    Offering_ID INT NOT NULL,
    Registration_Date DATE NOT NULL,
    Status VARCHAR(20) NOT NULL,
    UNIQUE (Student_ID, Offering_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Offering_ID) REFERENCES Course_Offering(Offering_ID)
) ENGINE=InnoDB;

-- 9. RESULT
CREATE TABLE Result (
    Result_ID INT PRIMARY KEY,
    Registration_ID INT NOT NULL UNIQUE,
    Score DECIMAL(5,2),
    Grade VARCHAR(2),
    Grade_Point DECIMAL(3,2),
    CHECK (Score IS NULL OR Score BETWEEN 0 AND 100),
    CHECK (
        Grade_Point IS NULL OR Grade_Point BETWEEN 0 AND 5
    ),
    FOREIGN KEY (Registration_ID)
        REFERENCES Registration(Registration_ID)
) ENGINE=InnoDB;

-- SAMPLE DATA
INSERT INTO Department VALUES
(1, 'Computer Science', 'Block A'),
(2, 'Mathematics', 'Block B');

INSERT INTO Programme VALUES
(101, 'BSc Computer Science', 'Bachelor', 1),
(102, 'BSc Mathematics', 'Bachelor', 2);

INSERT INTO Student VALUES
(1001, 'Amina', 'Yusuf', 'amina.yusuf@example.com',
 '2003-04-12', 2022, 101),
(1002, 'Maryam', 'Bello', 'maryam.bello@example.com',
 '2002-09-20', 2021, 101),
(1003, 'Ibrahim', 'Sani', 'ibrahim.sani@example.com',
 '2004-01-15', 2023, 102);

INSERT INTO Lecturer VALUES
(201, 'Fatima', 'Abdullahi',
 'fatima.abdullahi@example.com', 1),
(202, 'Musa', 'Garba',
 'musa.garba@example.com', 2);

INSERT INTO Course VALUES
(301, 'Database Systems', 3, 1),
(302, 'Data Structures', 3, 1),
(303, 'Linear Algebra', 2, 2);

INSERT INTO Semester VALUES
(401, 'First Semester', '2025/2026',
 '2025-09-15', '2025-12-20'),
(402, 'Second Semester', '2025/2026',
 '2026-01-12', '2026-04-25');

INSERT INTO Course_Offering VALUES
(501, 301, 201, 401),
(502, 302, 201, 401),
(503, 303, 202, 402);

INSERT INTO Registration VALUES
(601, 1001, 501, '2025-09-16', 'Registered'),
(602, 1001, 502, '2025-09-16', 'Registered'),
(603, 1002, 501, '2025-09-17', 'Registered'),
(604, 1003, 503, '2026-01-13', 'Registered');

INSERT INTO Result VALUES
(701, 601, 85.00, 'A', 5.00),
(702, 602, 76.00, 'B', 4.00),
(703, 603, 68.00, 'C', 3.00),
(704, 604, 91.00, 'A', 5.00);

-- PERFORMANCE INDEXES
CREATE INDEX idx_student_programme
    ON Student (Programme_ID);

CREATE INDEX idx_lecturer_department
    ON Lecturer (Department_ID);

CREATE INDEX idx_course_department
    ON Course (Department_ID);

CREATE INDEX idx_offering_course_semester
    ON Course_Offering (Course_ID, Semester_ID);

CREATE INDEX idx_registration_date
    ON Registration (Registration_Date);

CREATE INDEX idx_result_score
    ON Result (Score);

-- VERIFY ALL NINE TABLES
SELECT 'Department' AS Table_Name, COUNT(*) AS Total_Rows
FROM Department
UNION ALL SELECT 'Programme', COUNT(*) FROM Programme
UNION ALL SELECT 'Student', COUNT(*) FROM Student
UNION ALL SELECT 'Lecturer', COUNT(*) FROM Lecturer
UNION ALL SELECT 'Course', COUNT(*) FROM Course
UNION ALL SELECT 'Semester', COUNT(*) FROM Semester
UNION ALL SELECT 'Course_Offering', COUNT(*) FROM Course_Offering
UNION ALL SELECT 'Registration', COUNT(*) FROM Registration
UNION ALL SELECT 'Result', COUNT(*) FROM Result;

-- STUDENT AND PROGRAMME REPORT
SELECT
    s.Student_ID,
    CONCAT(s.First_Name, ' ', s.Last_Name) AS Student_Name,
    s.Email,
    p.Programme_Name,
    d.Department_Name
FROM Student s
JOIN Programme p ON s.Programme_ID = p.Programme_ID
JOIN Department d ON p.Department_ID = d.Department_ID
ORDER BY s.Student_ID;

-- RESULTS REPORT
SELECT
    s.Student_ID,
    CONCAT(s.First_Name, ' ', s.Last_Name) AS Student_Name,
    c.Course_Name,
    r.Score,
    r.Grade,
    r.Grade_Point
FROM Result r
JOIN Registration reg ON r.Registration_ID = reg.Registration_ID
JOIN Student s ON reg.Student_ID = s.Student_ID
JOIN Course_Offering co ON reg.Offering_ID = co.Offering_ID
JOIN Course c ON co.Course_ID = c.Course_ID
ORDER BY s.Student_ID, c.Course_Name;

-- QUERY PLAN FOR INDEX ANALYSIS
EXPLAIN
SELECT Student_ID, First_Name, Last_Name
FROM Student
WHERE Programme_ID = 101;
