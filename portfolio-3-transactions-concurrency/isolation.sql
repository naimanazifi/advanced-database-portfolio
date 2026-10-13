-- MIT 8103: Advanced Database Systems
-- Portfolio 3: Transactions and Concurrency
-- Demonstration of transaction isolation

-- Display the current transaction isolation level.
SELECT @@transaction_isolation;

-- Set the isolation level for the next transaction.
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

START TRANSACTION;

SELECT Student_ID, First_Name, Last_Name
FROM Student
WHERE Student_ID = 1001;

COMMIT;
