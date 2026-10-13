
-- MIT 8103: Indexing and Query Optimisation
-- University Student Management and Result Management System

-- 1. Speed up searches for students by programme.
CREATE INDEX idx_student_programme
ON Student (Programme_ID);

-- 2. Speed up searches for course offerings by course.
CREATE INDEX idx_offering_course
ON Course_Offering (Course_ID);

-- 3. Speed up searches for course offerings by semester.
CREATE INDEX idx_offering_semester
ON Course_Offering (Semester_ID);

-- 4. Speed up searches for registrations by student.
CREATE INDEX idx_registration_student
ON Registration (Student_ID);

-- 5. Speed up searches for registrations by offering.
CREATE INDEX idx_registration_offering
ON Registration (Offering_ID);

-- 6. Support filtering and sorting results by score.
CREATE INDEX idx_result_score
ON Result (Score);

-- Performance notes:
-- Indexes can reduce the amount of data scanned for matching rows.
-- They are especially useful on columns used in JOIN, WHERE and ORDER BY.
-- Indexes require storage and can slow INSERT, UPDATE and DELETE operations.
-- Primary keys and UNIQUE constraints already create indexes in many DBMSs.
-- Therefore, avoid creating duplicate indexes on those columns.
