
-- MIT 8103: Sample Data
-- Fictional records for testing the university database

INSERT INTO Department
    (Department_ID, Department_Name, Office_Location)
VALUES
    (1, 'Computer Science', 'Block A'),
    (2, 'Mathematics', 'Block B');

INSERT INTO Programme
    (Programme_ID, Programme_Name, Degree_Level, Department_ID)
VALUES
    (101, 'BSc Computer Science', 'Bachelor', 1),
    (102, 'BSc Mathematics', 'Bachelor', 2);

INSERT INTO Student
    (Student_ID, First_Name, Last_Name, Email,
     Date_Of_Birth, Admission_Year, Programme_ID)
VALUES
    (1001, 'Amina', 'Yusuf', 'amina.yusuf@example.com',
     '2003-04-12', 2022, 101),
    (1002, 'Maryam', 'Bello', 'maryam.bello@example.com',
     '2002-09-20', 2021, 101),
    (1003, 'Ibrahim', 'Sani', 'ibrahim.sani@example.com',
     '2004-01-15', 2023, 102);

INSERT INTO Lecturer
    (Lecturer_ID, First_Name, Last_Name, Email, Department_ID)
VALUES
    (201, 'Fatima', 'Abdullahi', 'fatima.abdullahi@example.com', 1),
    (202, 'Musa', 'Garba', 'musa.garba@example.com', 2);

INSERT INTO Course
    (Course_ID, Course_Name, Credit_Units, Department_ID)
VALUES
    (301, 'Database Systems', 3, 1),
    (302, 'Data Structures', 3, 1),
    (303, 'Linear Algebra', 2, 2);

INSERT INTO Semester
    (Semester_ID, Semester_Name, Academic_Year, Start_Date, End_Date)
VALUES
    (401, 'First Semester', '2025/2026', '2025-09-15', '2025-12-20'),
    (402, 'Second Semester', '2025/2026', '2026-01-12', '2026-04-25');

INSERT INTO Course_Offering
    (Offering_ID, Course_ID, Lecturer_ID, Semester_ID)
VALUES
    (501, 301, 201, 401),
    (502, 302, 201, 401),
    (503, 303, 202, 402);

INSERT INTO Registration
    (Registration_ID, Student_ID, Offering_ID, Registration_Date, Status)
VALUES
    (601, 1001, 501, '2025-09-16', 'Registered'),
    (602, 1001, 502, '2025-09-16', 'Registered'),
    (603, 1002, 501, '2025-09-17', 'Registered'),
    (604, 1003, 503, '2026-01-13', 'Registered');

INSERT INTO Result
    (Result_ID, Registration_ID, Score, Grade, Grade_Point)
VALUES
    (701, 601, 85.00, 'A', 5.00),
    (702, 602, 76.00, 'B', 4.00),
    (703, 603, 68.00, 'C', 3.00),
    (704, 604, 91.00, 'A', 5.00);
