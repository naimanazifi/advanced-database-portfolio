
-- MIT 8103: SQL Queries
-- University Student Management and Result Management System

-- 1. Display all students with their programme names.
SELECT
    s.Student_ID,
    s.First_Name,
    s.Last_Name,
    s.Email,
    p.Programme_Name
FROM Student s
JOIN Programme p
    ON s.Programme_ID = p.Programme_ID;

-- 2. List courses offered in each semester.
SELECT
    c.Course_Name,
    co.Offering_ID,
    se.Semester_Name,
    se.Academic_Year
FROM Course_Offering co
JOIN Course c
    ON co.Course_ID = c.Course_ID
JOIN Semester se
    ON co.Semester_ID = se.Semester_ID
ORDER BY se.Academic_Year, se.Semester_Name, c.Course_Name;

-- 3. Show students registered for each course offering.
SELECT
    s.Student_ID,
    s.First_Name,
    s.Last_Name,
    c.Course_Name,
    se.Semester_Name,
    r.Status
FROM Registration r
JOIN Student s
    ON r.Student_ID = s.Student_ID
JOIN Course_Offering co
    ON r.Offering_ID = co.Offering_ID
JOIN Course c
    ON co.Course_ID = c.Course_ID
JOIN Semester se
    ON co.Semester_ID = se.Semester_ID
ORDER BY c.Course_Name, s.Last_Name;

-- 4. Display student results and grades.
SELECT
    s.Student_ID,
    s.First_Name,
    s.Last_Name,
    c.Course_Name,
    res.Score,
    res.Grade,
    res.Grade_Point
FROM Result res
JOIN Registration r
    ON res.Registration_ID = r.Registration_ID
JOIN Student s
    ON r.Student_ID = s.Student_ID
JOIN Course_Offering co
    ON r.Offering_ID = co.Offering_ID
JOIN Course c
    ON co.Course_ID = c.Course_ID
ORDER BY s.Student_ID, c.Course_Name;

-- 5. Count students in each programme.
SELECT
    p.Programme_Name,
    COUNT(s.Student_ID) AS Total_Students
FROM Programme p
LEFT JOIN Student s
    ON p.Programme_ID = s.Programme_ID
GROUP BY p.Programme_ID, p.Programme_Name
ORDER BY Total_Students DESC;

-- 6. Calculate average score for each course.
SELECT
    c.Course_Name,
    AVG(res.Score) AS Average_Score,
    COUNT(res.Result_ID) AS Results_Recorded
FROM Course c
JOIN Course_Offering co
    ON c.Course_ID = co.Course_ID
JOIN Registration r
    ON co.Offering_ID = r.Offering_ID
JOIN Result res
    ON r.Registration_ID = res.Registration_ID
GROUP BY c.Course_ID, c.Course_Name
ORDER BY Average_Score DESC;
