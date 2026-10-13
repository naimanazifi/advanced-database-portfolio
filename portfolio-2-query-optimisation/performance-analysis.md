# Part 2: Query Optimisation and Performance Analysis

## 1. Introduction

This section evaluates indexing and query performance in the University Student Management and Result Management System. The database contains departments, programmes, students, lecturers, courses, semesters, course offerings, registrations and results.

Indexes can help MySQL locate records efficiently when queries filter, search or join tables using indexed columns.

## 2. Purpose of Indexing

An index is a database structure that helps MySQL find records without examining every row in a table. The project uses indexes to support common database operations.

The following additional indexes are defined in `indexes.sql`:

| Index | Table and column | Purpose |
|---|---|---|
| `idx_offering_semester` | `Course_Offering.Semester_ID` | Supports searches for course offerings by semester |
| `idx_registration_offering` | `Registration.Offering_ID` | Supports retrieval of registrations for a course offering |
| `idx_result_score` | `Result.Score` | May support filtering results by score |

Primary-key, unique-constraint and foreign-key indexes are also present where defined or created by MySQL. Existing indexes should be checked before adding new ones to avoid unnecessary duplication.

## 3. Query Performance Testing

The database was tested using MySQL 8 through DB Fiddle with fictional sample records.

The following queries were examined:

1. Retrieving course offerings and their semesters.
2. Retrieving students registered for each course.
3. Retrieving student results and grades.
4. Counting students in each programme.
5. Calculating average scores for each course.

The `EXPLAIN` statement was used to inspect query execution plans and determine whether MySQL used indexes.

### 3.1 Observed Results

The test for students by programme showed that MySQL used the `Programme_ID` index on the `Student` table.

The course-offering test showed that MySQL used the `Course_ID` index on `Course_Offering`.

The registration test showed that MySQL used the `Student_ID` index on `Registration`.

The score-filtering test showed a full table scan on the `Result` table rather than use of the `Score` index. This is not necessarily an error: because the sample table contains only four result records, MySQL may find scanning the table more efficient.

These observations describe the execution plans returned by the tests. They do not establish a measured improvement in execution speed.

## 4. Expected Benefits

The additional indexes may improve retrieval for queries that filter or join using `Semester_ID`, `Offering_ID` or `Score`, particularly as the database grows.

The actual benefit depends on data volume, data distribution, query structure and indexes already available.

## 5. Trade-offs and Limitations

Indexes require additional storage and must be maintained when records are inserted, updated or deleted. Too many indexes can therefore reduce write performance.

The small sample dataset is useful for checking SQL correctness and execution plans, but it is insufficient to establish reliable performance improvements. A larger dataset and repeated timing tests would be needed for a stronger comparison.

The `Result.Score` index may provide limited benefit when queries return a large proportion of the table's records.

## 6. Conclusion

The project demonstrates how indexing and the `EXPLAIN` statement can be used to investigate relational database performance. The tests confirmed index usage for selected queries and showed that MySQL may choose a table scan when it considers that approach more efficient. Further testing with a larger dataset would help determine which indexes provide meaningful benefits.
