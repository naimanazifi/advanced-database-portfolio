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

## 8. Running Part 2

The SQL implementation was tested using MySQL 8 through DB Fiddle.

To reproduce the tests:

1. Select MySQL 8 in DB Fiddle.
2. Run the table definitions in `schema.sql`.
3. Execute the statements in `sample-data.sql` after creating the tables.
4. Run the required statements from `queries.sql`.
5. Apply the additional indexes in `indexes.sql` after checking which indexes already exist.
6. Use `EXPLAIN` to inspect query execution plans and document the observed results.

The schema and sample data must be available together whenever the testing environment resets its database.

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

### 13. References and AI Use

#### 13.1 References

1. Oracle. (n.d.). *MySQL 8.0 Reference Manual: InnoDB Transaction Model.* MySQL Documentation. https://dev.mysql.com/doc/refman/8.0/en/innodb-transaction-model.html

2. Oracle. (n.d.). *MySQL 8.0 Reference Manual: COMMIT and ROLLBACK Statements.* MySQL Documentation. https://dev.mysql.com/doc/refman/8.0/en/commit.html

3. Oracle. (n.d.). *MySQL 8.0 Reference Manual: Optimization and Indexes.* MySQL Documentation. https://dev.mysql.com/doc/refman/8.0/en/optimization-indexes.html

4. Oracle. (n.d.). *MySQL 8.0 Reference Manual: EXPLAIN Statement.* MySQL Documentation. https://dev.mysql.com/doc/refman/8.0/en/explain.html

5. MongoDB, Inc. (n.d.). *MongoDB Manual: Documents.* MongoDB Documentation. https://www.mongodb.com/docs/manual/core/document/

6. MongoDB, Inc. (n.d.). *MongoDB Manual: Data Modeling.* MongoDB Documentation. https://www.mongodb.com/docs/manual/data-modeling/

7. MongoDB, Inc. (n.d.). *MongoDB Manual: Query on Embedded or Nested Documents.* MongoDB Documentation. https://www.mongodb.com/docs/manual/tutorial/query-embedded-documents/

#### 13.2 AI Use Reference

ChatGPT was consulted as a supplementary reference for clarifying database concepts and reviewing technical documentation. The final content was reviewed for accuracy and consistency with the project implementation.
