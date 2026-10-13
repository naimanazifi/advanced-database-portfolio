# Cloud Deployment Plan

## 1. Deployment Choice

The University Student Management System will use a managed MySQL-compatible cloud database. A managed service is appropriate because it reduces the need for the university to maintain database servers, apply routine patches manually and manage physical infrastructure.

## 2. Deployment Components

| Component | Purpose |
|---|---|
| Web application | Provides access to students, lecturers and administrators |
| Managed MySQL database | Stores student, course, registration and result records |
| Read replica | Supports suitable read-heavy queries |
| Automated backup storage | Supports recovery after data loss |
| Monitoring and alerting | Detects failures, high resource usage and replication delays |

## 3. Data Flow

1. An authorised user submits a request through the web application.
2. The application authenticates the user and checks permissions.
3. Write operations, including registrations and result updates, go to the primary database.
4. Suitable read-only requests may use a replica.
5. Automated backups and monitoring run according to the configured cloud-service policies.

## 4. Availability and Recovery

The database should use a standby in a separate availability zone if supported by the selected service and budget. Automated backups and point-in-time recovery should be enabled where available. The university should define recovery time and recovery point objectives, test restoration, and document the failover process.

## 5. Security Configuration

The database should use private network access where possible, encrypted connections, least-privilege database accounts, secure credential storage, audit logging and encrypted backups. Database credentials must not be committed to the GitHub repository.

## 6. Validation Checklist

- [ ] Confirm the database accepts connections only from approved sources.
- [ ] Verify application permissions for each user role.
- [ ] Confirm automated backups complete successfully.
- [ ] Test restoration using a non-production environment.
- [ ] Check replica health and replication lag.
- [ ] Test application reconnection after a simulated database interruption.
- [ ] Review monitoring alerts and logs.

## 7. Implementation Status

This document describes the proposed deployment. A cloud service has not been provisioned or tested as part of this design exercise. The checklist must be completed and evidence recorded before the system can be described as deployed.
