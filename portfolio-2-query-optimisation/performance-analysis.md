# Performance Analysis and Query Optimisation

## 1. Introduction

This section examines how indexes can improve the performance of the University Student Management and Result Management System. The database contains information about departments, programmes, students, lecturers, courses, semesters, course offerings, registrations and results.

As the number of records increases, queries may take longer to execute. Appropriate indexing can help the database locate records more efficiently.

## 2. Purpose of Indexing

An index is a database structure that helps the database find records without scanning every row in a table. Indexes are particularly useful for columns frequently used in joins, filtering and searching.

The following indexes were selected for this project:

| Index | Column | Reason |
|---|---|---|
| `idx_student_programme` | `Student.Programme_ID` | Supports joins between students and programmes |
| `idx_offering_course` | `Course_Offering.Course_ID` | Supports searches for offerings of a particular course |
| `idx_offering_semester` | `Course_Offering.Semester_ID` | Supports searches by semester |
| `idx_registration_student` | `Registration.Student_ID` | Supports retrieval of a student's registrations |
| `idx_registration_offering` | `Registration.Offering_ID` | Supports retrieval of students registered for an offering |
| `idx_result_score` | `Result.Score` | May help queries filtering or sorting by score |

## 3. Query Performance Testing

Performance should be evaluated by comparing queries before and after creating the indexes.

The following procedure can be used:

1. Create a representative dataset containing student, course, registration and result records.
2. Run selected queries before creating the additional indexes.
3. Record each query's execution time and query plan.
4. Create the indexes in `indexes.sql`.
5. Run the same queries again under comparable conditions.
6. Compare execution times and query plans to determine whether performance improved.

The same database engine, dataset and query conditions should be used in both tests. Where possible, queries should be executed more than once to reduce the influence of temporary system activity.

### 3.1 Observed Test Results

The SQL queries were tested using MySQL 8 in DB Fiddle with a small sample dataset containing three students, three course offerings and four result records. The `EXPLAIN` statement was used to examine how MySQL planned selected queries.

The execution plans showed index use for searches on `Student.Programme_ID`, `Course_Offering.Course_ID` and `Registration.Student_ID`. These results indicate that MySQL could use the relevant indexes for those conditions.

For the query filtering `Result` records with `Score >= 80`, MySQL performed a full table scan rather than using the score index. The plan reported four rows to examine. This is reasonable for a very small table, where scanning all rows may cost less than accessing an index.

These tests confirm the observed query plans, but they do not establish a measured improvement in execution speed. A larger dataset and repeated tests with and without the additional indexes would be needed to measure performance differences reliably.

## 4. Expected Benefits

The selected indexes may reduce the number of rows the database needs to examine when retrieving related records. They may improve joins involving student programmes, course offerings and registrations.

The actual benefit depends on the size and distribution of the data, the database engine, the query structure and the indexes already available.

## 5. Trade-offs and Limitations

Indexes require additional storage space and must be maintained when records are inserted, updated or deleted. Too many indexes may therefore reduce write performance.

Primary keys and unique constraints commonly create indexes automatically. Additional indexes should be reviewed to avoid unnecessary duplication. The `Result.Score` index may offer limited benefit if the table is small or most queries retrieve a large proportion of its rows.

No measured performance improvement is claimed until tests have been conducted.

## 6. Conclusion

Indexing is an important technique for improving relational database performance. The proposed indexes target common relationships and retrieval operations in the university management system. Testing with representative data will determine which indexes provide meaningful benefits and whether any should be adjusted or removed.
