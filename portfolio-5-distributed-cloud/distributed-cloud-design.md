# Portfolio 5: Distributed and Cloud Database Design

## University Student Management and Result Management System

### 1. Introduction

The University Student Management and Result Management System stores information about students, programmes, departments, lecturers, courses, registrations and academic results. As the number of students and university campuses increases, a single database server may become a bottleneck or a single point of failure.

This portfolio proposes a distributed and cloud-based database architecture that supports availability, data consistency, security and future growth. The design is intended for a university operating across multiple campuses or locations. It is a proposed architecture, not a claim of a completed cloud deployment.

### 2. Proposed Architecture

The system will use a primary relational database hosted on a managed cloud database service. University applications will connect to the database through a secure application layer rather than connecting directly from users' devices.

The architecture will contain the following components:

1. **Application layer:** A web application through which authorised students, lecturers and administrators access the system.
2. **Primary database:** A managed MySQL database responsible for processing approved inserts, updates and deletes.
3. **Read replica:** A secondary database that receives replicated data and serves suitable read-only reports, reducing the workload on the primary database.
4. **Backup storage:** A separate storage location for encrypted database backups and recovery copies.
5. **Monitoring service:** A monitoring system that tracks database availability, storage usage, replication delay, failed connections and query performance.

The primary database remains the authoritative source for student records and results. Read replicas improve read capacity but should not be treated as independent authoritative databases.

### 3. Data Distribution and Replication

The proposed system will use primary-to-replica replication. Changes committed on the primary database are transferred to the replica, subject to replication delay and the selected replication configuration.

The primary database will handle important transactions, including student registration and result updates. Read replicas may handle reporting queries, such as student enrolment totals and course performance summaries.

Replication is not necessarily instantaneous. Therefore, a user who updates a result may temporarily see an older value when reading from a lagging replica. The application should direct critical read-after-write operations to the primary database or use a consistency mechanism appropriate to the chosen cloud service.

The initial deployment will retain a central authoritative database rather than splitting student records across independently writable campus databases. This reduces the risk of conflicting updates to student registrations and results.

### 4. Availability and Failure Recovery

The design will use the following measures to reduce downtime:

- **High availability:** Where supported, configure the managed database service with a standby instance in a separate availability zone.
- **Automated backups:** Enable scheduled backups and point-in-time recovery where the service supports them.
- **Replication monitoring:** Alert administrators when replica lag exceeds an agreed threshold.
- **Failover procedures:** Document and test how the service promotes a healthy standby when the primary database becomes unavailable.
- **Recovery testing:** Periodically restore a backup in a test environment to confirm that the recovery process works.

A read replica is not automatically a complete backup. Accidental deletions or corrupted data may also be replicated, so independent backups and tested recovery procedures remain necessary.

The university should define a Recovery Point Objective (RPO), which specifies the acceptable amount of data loss, and a Recovery Time Objective (RTO), which specifies the acceptable time required to restore service. These targets should be agreed with university management and validated through recovery tests rather than assumed.

### 5. Security and Data Protection

Student records and academic results are sensitive institutional information. The proposed system will apply the following controls:

- Use role-based access control to restrict students, lecturers and administrators to the records and operations required for their responsibilities.
- Require encrypted connections between the application and database.
- Enable encryption at rest for database storage and backups where supported.
- Store credentials and encryption keys securely rather than embedding them in application source code.
- Record important administrative actions and changes to academic results in audit logs.
- Apply regular security patches and review database permissions.
- Back up data to a protected location with access controls separate from ordinary application access.

These controls reduce the risk of unauthorised disclosure, accidental modification and loss of academic records.

### 6. Implementation and Evaluation Plan

The system can be implemented in stages:

| Stage | Activity | Evidence of completion |
|---|---|---|
| 1 | Create and validate the relational schema and sample data | Successful schema and data validation |
| 2 | Deploy the primary database in a cloud test environment | Successful connection and CRUD tests |
| 3 | Configure a read replica and test replication | A committed test record becomes available on the replica |
| 4 | Configure backups and perform a test restoration | Restored database passes record-count and integrity checks |
| 5 | Test monitoring and recovery procedures | Alerts and recovery outcomes are documented |
| 6 | Review security, cost and performance | Permissions, monitoring results and cost estimates are documented |

Testing should include a controlled primary-database failure, replica-lag observation, backup restoration, and verification of student-registration and result records after recovery. Tests should be performed in a non-production environment to avoid disrupting university operations.

No live cloud deployment, failover test or measured performance improvement is claimed in this portfolio unless supporting evidence is collected.

### 7. Limitations and Trade-offs

A managed cloud database can reduce infrastructure maintenance, but it introduces recurring service costs and dependence on network connectivity. If a campus loses internet access, users may temporarily be unable to reach the central database.

Replication also introduces operational complexity, and asynchronous replicas may lag behind the primary. High availability does not eliminate every outage, while backups are only useful if they can be restored successfully.

The university should compare cloud-service costs, data residency requirements, network reliability, security responsibilities and recovery guarantees before choosing a provider. Local caching of academic results should be avoided unless a carefully controlled synchronisation design prevents conflicting updates.

### 8. Conclusion

The proposed architecture combines a managed MySQL primary database, read replication, independent backups, monitoring and documented recovery procedures. It provides a practical foundation for supporting a growing university system while protecting the consistency and availability of student records.

The design also recognises that replication, high availability and backups solve different problems. A production deployment would require implementation, security review, cost assessment and recovery testing before the university could rely on it for critical academic operations.

### References

1. MySQL Documentation. *Replication*. https://dev.mysql.com/doc/refman/8.4/en/replication.html
2. MySQL Documentation. *Backup and Recovery*. https://dev.mysql.com/doc/refman/8.4/en/backup-and-recovery.html
3. MySQL Documentation. *InnoDB and Transaction Processing*. https://dev.mysql.com/doc/refman/8.4/en/innodb-transaction-model.html

