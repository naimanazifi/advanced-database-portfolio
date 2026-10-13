-- MIT 8103: Advanced Database Systems
-- Portfolio 3: Transactions and Concurrency
-- Prevent duplicate course registrations

-- The Registration table already has:
-- UNIQUE (Student_ID, Offering_ID)
-- This constraint prevents duplicate registrations.

-- Test an existing student and course offering.
SELECT
    Student_ID,
    Offering_ID,
    Registration_ID,
    Status
FROM Registration
WHERE Student_ID = 1001
  AND Offering_ID = 501;

-- Attempting to insert this same student-offering pair
-- again should produce a duplicate-key error.
-- Run this INSERT separately as a test:
-- INSERT INTO Registration
--     (Registration_ID, Student_ID, Offering_ID,
--      Registration_Date, Status)
-- VALUES
--     (605, 1001, 501, '2025-09-18', 'Registered');
