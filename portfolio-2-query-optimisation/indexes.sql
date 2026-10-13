
-- MIT 8103: University Student Management System
-- Part 2: Query Optimisation
-- Indexes for frequently used search and join columns

CREATE INDEX idx_student_programme
ON Student (Programme_ID);

CREATE INDEX idx_offering_semester
ON Course_Offering (Semester_ID);

CREATE INDEX idx_registration_offering
ON Registration (Offering_ID);

CREATE INDEX idx_result_score
ON Result (Score);

-- Note:
-- Primary-key, unique-constraint and foreign-key indexes
-- may already exist. Avoid creating redundant indexes.
