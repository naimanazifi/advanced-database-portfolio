-- MIT 8103: Advanced Database Systems
-- Portfolio 3: Transactions and Concurrency
-- Demonstration of transaction isolation

-- Check the current session isolation level.
SELECT @@transaction_isolation;

-- Set isolation for the next transaction.
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Verify the configured isolation level.
SELECT @@transaction_isolation;

START TRANSACTION;

SELECT Student_ID, First_Name, Last_Name
FROM Student
WHERE Student_ID = 1001;

COMMIT;
