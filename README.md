# Advanced Database Systems Portfolio

**Course Code:** MIT 8103  
**Academic Session:** 2026/2027  
**Semester:** First Semester

## 1. Selected Case Study

**Organisation:** University Student Management and Result Management System

## 2. Project Overview

This project focuses on designing and implementing a relational database system for a university. The system manages student records, departments, programmes, courses, lecturers, semesters, course registrations and academic results.

The objective is to develop a structured and reliable database that supports accurate data storage, retrieval, updating and reporting while maintaining data integrity.

## 3. Database Users

The main users of the system are:

- Students
- Lecturers
- Department administrators
- Academic registry officers
- System administrators

## 4. Major Data to Be Stored

The database stores student details, department information, academic programmes, course records, lecturer details, semester information, course offerings, registrations and student results.

## 5. Key Database Operations

The system is designed to support:

- Registering students for courses.
- Managing departments, programmes, lecturers and courses.
- Recording and retrieving student results.
- Calculating grade point averages (GPA).
- Generating academic transcripts.
- Producing reports on student enrolment and academic performance.
- Retrieving records efficiently using SQL queries and indexes.

## 6. Portfolio Objectives

This portfolio demonstrates the application of advanced database concepts, including:

- Relational database design and normalisation.
- SQL implementation, querying and optimisation.
- Transaction management and concurrency control.
- NoSQL database modelling.
- Distributed and cloud database concepts.
- Database performance evaluation and technical documentation.

## 7. Repository Structure

The repository is organised into sections corresponding to the portfolio activities.

### Part 1: Database Design

Contains the database design materials, including the entity-relationship diagram.

### Part 2: Query Optimisation

The `portfolio-2-query-optimisation/` directory contains:

- `schema.sql` — creates the database tables, relationships and constraints.
- `sample-data.sql` — provides fictional records for testing.
- `queries.sql` — contains SQL queries for retrieving and analysing academic data.
- `indexes.sql` — defines additional indexes for selected query operations.
- `performance-analysis.md` — documents indexing decisions, observed execution plans, benefits and limitations.

### Master SQL Script

The repository root contains `university_database.sql`, a consolidated MySQL script that creates the nine relational tables, inserts sample data, defines performance indexes, verifies row counts, generates reports and examines a query execution plan.

## 8. Running Part 2

The master SQL script was executed using CompileBytes MySQL Playground with MySQL 8.4.11. The verification output showed all nine tables and the expected sample row counts.

To reproduce the master-script test:

1. Open a MySQL 8-compatible environment.
2. Select an empty database/schema in which you have permission to create tables and indexes.
3. Open `university_database.sql` from the repository root.
4. Execute the complete script.
5. Review the verification output and reports.
6. Inspect the `EXPLAIN` output to understand the query execution plan.

The script does not create or select a database automatically and does not drop existing tables. Use an empty schema to avoid table-already-exists errors.

For the separate Part 2 scripts, run `schema.sql` before `sample-data.sql`, then execute `queries.sql` and apply `indexes.sql` as appropriate. Use the testing environment specified for those scripts and ensure the schema and sample data are available after any database reset.

## 9. Development Approach

The project is developed progressively throughout the semester. SQL scripts, database models, test results, screenshots, technical explanations and supporting documentation are maintained in this repository.

Each portfolio activity is documented and tested as it is completed. Performance claims are based on observed results, and limitations are stated where additional testing is required.

## 10. Conclusion

This portfolio applies advanced database principles to a university student management and result management case study. It provides a foundation for exploring data integrity, efficient query processing, transaction management and other database technologies throughout the course.

## 11. Portfolio Summary

- **Portfolio 1 – Database Design:** Relational schema, entity relationships, keys and integrity constraints.
- **Portfolio 2 – Query Optimisation:** SQL queries, joins, indexes and execution-plan analysis.
- **Portfolio 3 – Transactions and Concurrency:** COMMIT, ROLLBACK, isolation concepts and duplicate-registration prevention.
- **Portfolio 4 – NoSQL:** MongoDB document modelling and queries for student profiles, programmes and skills.
- **Portfolio 5 – Distributed and Cloud Databases:** Proposed cloud architecture, replication, backups, monitoring and recovery.

## 12. Technical Reflection

This project improved my understanding of database design, transaction processing, query performance, document databases and cloud database architecture. The MySQL exercises demonstrated how transactions and integrity constraints help protect academic records. The MongoDB exercises showed how nested documents and arrays can support flexible student profiles. The cloud design highlighted the importance of replication, backups, security and recovery planning.

Some limitations remain. A two-session concurrency experiment has not been completed, and the cloud architecture has not been deployed to a live service. Further work would include testing simultaneous transactions, measuring query performance, validating backup restoration and testing recovery from database failure.

## 13. References and AI Use

### 13.1 References

1. Oracle. (n.d.). *MySQL 8.0 Reference Manual: InnoDB Transaction Model.* MySQL Documentation. https://dev.mysql.com/doc/refman/8.0/en/innodb-transaction-model.html

2. Oracle. (n.d.). *MySQL 8.0 Reference Manual: COMMIT and ROLLBACK Statements.* MySQL Documentation. https://dev.mysql.com/doc/refman/8.0/en/commit.html

3. Oracle. (n.d.). *MySQL 8.0 Reference Manual: Optimization and Indexes.* MySQL Documentation. https://dev.mysql.com/doc/refman/8.0/en/optimization-indexes.html

4. Oracle. (n.d.). *MySQL 8.0 Reference Manual: EXPLAIN Statement.* MySQL Documentation. https://dev.mysql.com/doc/refman/8.0/en/explain.html

5. MongoDB, Inc. (n.d.). *MongoDB Manual: Documents.* MongoDB Documentation. https://www.mongodb.com/docs/manual/core/document/

6. MongoDB, Inc. (n.d.). *MongoDB Manual: Data Modeling.* MongoDB Documentation. https://www.mongodb.com/docs/manual/data-modeling/

7. MongoDB, Inc. (n.d.). *MongoDB Manual: Query on Embedded or Nested Documents.* MongoDB Documentation. https://www.mongodb.com/docs/manual/tutorial/query-embedded-documents/

### 13.2 AI Use Reference

ChatGPT was used to clarify database concepts and review documentation. I reviewed the content and checked the examples against the project tests. Any proposed designs and uncompleted tests are identified accordingly.

## 14. Master SQL Script and Execution Guide

### 14.1 Script Overview

The root-level file `university_database.sql` contains the consolidated MySQL implementation of the University Student Management and Result Management System. It defines nine related tables: Department, Programme, Student, Lecturer, Course, Semester, Course_Offering, Registration and Result.

The script includes primary keys, foreign key relationships, unique constraints, check constraints, fictional sample records, performance indexes, verification queries, student and result reports, and an `EXPLAIN` statement for query-plan analysis.

### 14.2 How to Run the Script

1. Open MySQL 8 or a compatible environment.
2. Select an empty database/schema where you have permission to create tables and indexes.
3. Open `university_database.sql`.
4. Execute the complete script.
5. Review the verification output to confirm the table counts.
6. Inspect the student and result reports.
7. Review the `EXPLAIN` output to understand the execution plan.

**Important:** The script does not create or select a database automatically and does not drop existing tables. Use an empty schema to avoid table-already-exists errors.

### 14.3 Expected Verification Results

| Table | Expected rows |
|---|---:|
| Department | 2 |
| Programme | 2 |
| Student | 3 |
| Lecturer | 2 |
| Course | 3 |
| Semester | 2 |
| Course_Offering | 3 |
| Registration | 4 |
| Result | 4 |
| **Total** | **25** |

These counts correspond to the fictional records supplied in the current master script.

### 14.4 Execution Evidence

The `screenshots/` directory contains screenshots of the database verification output, student and programme report, result report and query execution plan.

The `EXPLAIN` statement examines the query plan for retrieving students by programme. The `idx_student_programme` index is available for this lookup, but the MySQL optimiser decides whether to use it based on factors such as the query, dataset size and data distribution. The actual execution plan should be reported as observed.

### 14.5 Limitations and Further Work

The sample dataset is intentionally small and fictional. It demonstrates relational design, integrity constraints, reporting queries and basic index analysis, but it is not sufficient to establish production-scale performance.

Further evaluation could use a larger dataset, compare execution plans before and after indexing, measure query execution times, test concurrent registrations, and validate transaction recovery. Transaction and concurrency testing, NoSQL implementation, and distributed or cloud database design are documented separately in their respective portfolio directories.
