# Portfolio 3: Transactions and Concurrency

## 1. Introduction

This portfolio examines transaction management and concurrency control in the University Student Management and Result Management System. The practical work uses MySQL 8 and fictional student records.

## 2. ROLLBACK Test

A transaction updated student 1001's first name from `Amina` to `RollbackTest`. After executing `ROLLBACK`, a query showed that the name had returned to `Amina Yusuf`.

**Observation:** The change was undone, demonstrating how ROLLBACK reverses an uncommitted transaction.

## 3. COMMIT Test

A transaction changed student 1001's first name to `AminaCommit`. After `COMMIT`, the query returned `AminaCommit` and `Yusuf`.

**Observation:** The update was visible after the commit in the tested run. Persistence across separate database sessions was not independently verified.

## 4. Transaction Isolation

The `isolation.sql` file demonstrates how to inspect MySQL's transaction isolation level and set `READ COMMITTED` for the next transaction.

`READ COMMITTED` allows a transaction to read data committed by other transactions, helping prevent dirty reads. A complete concurrency experiment would require two independent database sessions; that experiment was not performed in DB Fiddle.

## 5. Duplicate Registration Prevention

The `Registration` table contains a unique constraint on `(Student_ID, Offering_ID)`. An attempt to register student 1001 for offering 501 again was rejected with a duplicate-key error.

**Observation:** The unique constraint protects data integrity by preventing duplicate registrations. It also helps protect against duplicate attempts made concurrently, although the test performed here did not simulate simultaneous transactions.

## 6. Limitations

The practical tests were performed using DB Fiddle with MySQL 8. The tests demonstrate rollback, commit behaviour, and duplicate-registration enforcement. Separate-session concurrency behaviour and persistence across sessions were not independently tested.

## 7. Conclusion

The practical work illustrates the importance of transaction control and database constraints in maintaining consistent university records. `COMMIT` saves transaction changes, `ROLLBACK` undoes uncommitted changes, and a unique constraint prevents duplicate student-course registrations. Independent-session testing would provide further evidence of concurrent transaction behaviour.
