
-- MIT 8103: University Student Management System
-- Part 2: Query Optimisation
-- Indexes for frequently used search and join columns

-- 1. Speed up searches for course offerings by semester.
CREATE INDEX idx_offering_semester
ON Course_Offering (Semester_ID);

-- 2. Speed up searches for registrations by course offering.
CREATE INDEX idx_registration_offering
ON Registration (Offering_ID);

-- 3. Support filtering and sorting results by score.
CREATE INDEX idx_result_score
ON Result (Score);

-- Performance notes:
-- Primary-key, unique-constraint and foreign-key indexes
-- may already exist. Avoid creating redundant indexes.
-- Indexes can improve retrieval but require storage space
-- and may slow INSERT, UPDATE and DELETE operations.
-- The Result.Score index may offer limited benefit when
-- the Result table is small.
