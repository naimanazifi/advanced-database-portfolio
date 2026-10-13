
-- MIT 8103: University Student Management System
-- Part 2: SQL Implementation
-- Database schema

CREATE TABLE Department (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(100) NOT NULL UNIQUE,
    Office_Location VARCHAR(100)
);

CREATE TABLE Programme (
    Programme_ID INT PRIMARY KEY,
    Programme_Name VARCHAR(100) NOT NULL,
    Degree_Level VARCHAR(50),
    Department_ID INT NOT NULL,
    FOREIGN KEY (Department_ID)
        REFERENCES Department(Department_ID)
);

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
);

CREATE TABLE Lecturer (
    Lecturer_ID INT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    Department_ID INT NOT NULL,
    FOREIGN KEY (Department_ID)
        REFERENCES Department(Department_ID)
);

CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(100) NOT NULL,
    Credit_Units INT NOT NULL,
    Department_ID INT NOT NULL,
    FOREIGN KEY (Department_ID)
        REFERENCES Department(Department_ID)
);

CREATE TABLE Semester (
    Semester_ID INT PRIMARY KEY,
    Semester_Name VARCHAR(50) NOT NULL,
    Academic_Year VARCHAR(9) NOT NULL,
    Start_Date DATE,
    End_Date DATE
);

CREATE TABLE Course_Offering (
    Offering_ID INT PRIMARY KEY,
    Course_ID INT NOT NULL,
    Lecturer_ID INT NOT NULL,
    Semester_ID INT NOT NULL,
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID),
    FOREIGN KEY (Lecturer_ID) REFERENCES Lecturer(Lecturer_ID),
    FOREIGN KEY (Semester_ID) REFERENCES Semester(Semester_ID)
);

CREATE TABLE Registration (
    Registration_ID INT PRIMARY KEY,
    Student_ID INT NOT NULL,
    Offering_ID INT NOT NULL,
    Registration_Date DATE NOT NULL,
    Status VARCHAR(20) NOT NULL,
    UNIQUE (Student_ID, Offering_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Offering_ID) REFERENCES Course_Offering(Offering_ID)
);

CREATE TABLE Result (
    Result_ID INT PRIMARY KEY,
    Registration_ID INT NOT NULL UNIQUE,
    Score DECIMAL(5,2),
    Grade VARCHAR(2),
    Grade_Point DECIMAL(3,2),
    FOREIGN KEY (Registration_ID)
        REFERENCES Registration(Registration_ID),
    CHECK (Score IS NULL OR (Score >= 0 AND Score <= 100))
);
