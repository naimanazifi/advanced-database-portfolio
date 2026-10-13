# Portfolio 5: Distributed and Cloud Database Design

## 1. Introduction

This portfolio proposes a distributed and cloud-based design for the University Student Management System. The system stores student profiles, course registrations, academic results and programme information. As student numbers grow, a single database server may become a bottleneck or a single point of failure.

The proposed design uses a managed cloud database, controlled replication, secure remote access and regular backups to improve availability, scalability and recovery.

## 2. Proposed Architecture

The system follows a three-layer architecture:

1. **Application layer:** A web application used by students, lecturers and authorised administrators.
2. **Database layer:** A primary relational database that stores students, programmes, course offerings, registrations and results.
3. **Backup and recovery layer:** Encrypted backups stored separately from the live database, with a documented restoration process.

For a practical implementation, the relational database could be deployed using a managed MySQL-compatible cloud service. A production deployment should use a high-availability configuration with a primary database and a synchronised standby or replica in a separate availability zone where supported.

## 3. Distribution and Replication Strategy

The database should use a primary-replica model.

- **Primary database:** Handles student registration, result entry and other write operations.
- **Read replica:** Serves suitable read-heavy requests, such as viewing course catalogues and published results.
- **Standby replica:** Supports recovery or failover if the primary database becomes unavailable, depending on the managed service configuration.
- **Encrypted backups:** Provide recovery from accidental deletion, corruption or wider service failure.

Not every read should be sent to a replica. Registration and result updates should use the primary database, and read-after-write operations should read from the primary or use a consistency mechanism that ensures the latest committed data is visible.

Replication improves availability and read capacity, but it is not a replacement for backups.

## 4. Consistency and Transaction Management

Student registration and academic results require strong data integrity. The existing MySQL schema uses primary keys, foreign keys, unique constraints and a score check constraint to protect data.

Transactions should be used for operations that involve multiple related changes. For example, a registration process should confirm that the student and course offering exist before creating a registration record. The unique constraint on `(Student_ID, Offering_ID)` prevents the same student from registering for the same course offering twice.

A read replica may temporarily lag behind the primary database. Therefore, the system should not rely on a potentially stale replica immediately after a registration or result update.

## 5. Scalability and Performance

The system can scale by separating application servers from database servers and using read replicas for suitable queries. Indexes should be created on frequently searched fields, and query execution plans should be reviewed to identify slow queries.

If the university grows substantially, student records could be partitioned by a suitable key or distributed across database nodes, but partitioning should only be introduced after measuring the workload. Poor partition-key selection can increase query complexity and create uneven data distribution.

## 6. Security and Access Control

The deployment should apply the following controls:

- Encrypt database connections using TLS.
- Restrict database access to approved application servers and administrators.
- Use separate accounts and
