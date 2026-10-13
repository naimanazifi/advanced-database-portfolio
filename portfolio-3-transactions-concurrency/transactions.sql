-- MIT 8103: Advanced Database Systems
-- Portfolio 3: Transactions and Concurrency
-- Case Study: University Student Management System

-- Test 1: ROLLBACK
START TRANSACTION;

UPDATE Student
SET First_Name = 'RollbackTest'
WHERE Student_ID = 1001;

ROLLBACK;

-- Verify that the original name is restored.
SELECT Student_ID, First_Name, Last_Name
FROM Student
WHERE Student_ID = 1001;


-- Test 2: COMMIT
START TRANSACTION;

UPDATE Student
SET First_Name = 'AminaCommit'
WHERE Student_ID = 1001;

COMMIT;

-- Verify the committed value.
SELECT Student_ID, First_Name, Last_Name
FROM Student
WHERE Student_ID = 1001;
