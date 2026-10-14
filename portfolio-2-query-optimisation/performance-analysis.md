# Part 2: Query Optimisation and Performance Analysis

## 1. Introduction

This section evaluates indexing and query performance in the University Student Management and Result Management System. The database contains departments, programmes, students, lecturers, courses, semesters, course offerings, registrations and results.

Indexes can help MySQL locate records efficiently when queries filter, search or join tables using indexed columns. This analysis examines the purpose of indexing, selected SQL queries, execution plans, expected benefits and limitations.

## 2. Purpose of Indexing

An index is a database structure that helps MySQL locate records without examining every row in a table. The project uses indexes to support common database operations.

The following additional indexes are defined in `indexes.sql`:

| Index | Table and column | Purpose |
|---|---|---|
| `idx_offering_semester` | `Course_Offering.Semester_ID` | Supports searches for course offerings by semester |
| `idx_registration_offering` | `Registration.Offering_ID` | Supports retrieval of registrations by course offering |
| `idx_result_score` | `Result.Score` | May support filtering results by score |

The schema also defines primary keys and unique constraints. MySQL may create supporting indexes for these constraints and for foreign keys where required. Existing indexes should be checked before adding new ones to avoid unnecessary duplication.

## 3. Query Performance Testing

The database queries were designed to retrieve student information, course offerings, registrations, results, programme enrolment counts and average course scores.

The `EXPLAIN` statement can be used before a `SELECT` query to inspect the execution plan selected by MySQL. It provides information about how tables may be accessed, which indexes may be used and how joins are processed.

### 3.1 Observed Results

The SQL queries were tested using fictional university records. The `EXPLAIN` statement was used to inspect how MySQL planned to execute selected queries.

The student-by-programme query can use an index on `Student.Programme_ID` if a suitable index exists and the query plan selects it. The course-offering and registration queries involve joins on foreign-key columns, for which MySQL may use available indexes.

The `idx_offering_semester` index supports queries that filter or join course offerings by semester. The `idx_registration_offering` index supports retrieval of registrations by course offering. The `idx_result_score` index may support queries that filter results by score.

An index does not guarantee that MySQL will use it. The optimizer considers factors such as table size, data distribution and the estimated cost of different execution plans. The sample dataset is small, so a full table scan may be reasonable for some queries.

The tests demonstrate how execution plans can be inspected, but they do not establish a measured improvement in query execution time.

## 4. Expected Benefits

The additional indexes may improve retrieval for queries that filter or join using `Semester_ID`, `Offering_ID` or `Score`, particularly as the database grows.

The actual benefit depends on data volume, data distribution, query structure and the indexes already available. Queries that retrieve a large proportion of a table may not benefit significantly from an index.

## 5. Trade-offs and Limitations

Indexes require additional storage and must be maintained when records are inserted, updated or deleted. Too many indexes can therefore reduce write performance.

The small sample dataset is useful for checking SQL correctness and inspecting execution plans, but it is insufficient to establish reliable performance improvements. A larger dataset and repeated execution-time measurements would be needed for a stronger comparison.

The `Result.Score` index may provide limited benefit when queries return a large proportion of the table's records. MySQL may choose a full table scan when it estimates that scanning the table is more efficient than using an index.

A further limitation is that the project does not establish a quantified speed improvement because no controlled before-and-after execution-time measurements are reported.

## 6. Conclusion

The project demonstrates how indexing and the `EXPLAIN` statement can be used to investigate relational database performance. The additional indexes target semester-based offering searches, offering-based registration retrieval and score filtering.

The effectiveness of these indexes depends on the queries, dataset size and execution plans chosen by MySQL. Further testing with a larger dataset, controlled timing measurements and comparisons before and after indexing would help determine which indexes provide meaningful performance benefits.
