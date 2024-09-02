# Relational Database Schemas, Management, and Version Control
This repository provides tools and guidelines for managing relational database schemas, handling database version control, and applying schema migrations using Flyway. It focuses on PostgreSQL and AWS-managed relational databases, including Amazon RDS and Amazon Aurora.

## Table of Contents
1. [Introduction](#introduction)
2. [Supported Databases](#supported-databases)
3. [Tools Used](#tools-used)
4. [Getting Started](#getting-started)
5. [Database Schema Management](#database-schema-management)
6. [Version Control with Flyway](#version-control-with-flyway)
7. [Migration Workflow](#migration-workflow)
8. [Best Practices](#migration-workflow)

## Introduction
Relational databases are a crucial part of many applications. This repository offers best practices and tools for effectively managing relational databases, focusing on schema version control, migrations, and management using Flyway.

## Supported Databases
This project is designed to work with the following relational databases:

- **PostgreSQL:** An open-source relational database known for its powerful features and extensibility.
- **AWS Relational Databases:** Managed databases on AWS, including Amazon RDS and Amazon Aurora.

## Tools Used
- **PostgreSQL:** The primary RDBMS for local development and testing.
- **AWS RDS and Aurora:** Managed relational databases on AWS for production environments.
- **Flyway:** A database migration tool that enables easy version control and schema management.

## Getting Started

### Prerequisites
Ensure you have the following installed:

1. **PostgreSQL** (version 12 or later)
2. **AWS CLI** for managing AWS services
3. **Flyway** (version 8.x or later)

### Installation
1. **Clone the repository:**

```bash
   git clone git@github.com:SbonisoGordonMzizi/relational-database-schemas-management-version-control.git
   cd relational-database-schemas-management-version-control
```
2. **Install PostgreSQL:** Follow the installation instructions for your operating system on the PostgreSQL Downloads page.

3. **Set up AWS CLI:** Configure AWS CLI with your credentials. For more details, see the AWS CLI Configuration guide.

4. **Install Flyway:** Download and install Flyway from the Flyway Downloads page.

## Database Schema Management
### Creating Schemas
- Schemas define the structure of your database, including tables, indexes, views, and more. You can create schemas manually using SQL or automate the process using tools like Flyway.

### Managing Schemas
- Use PostgreSQL or AWS RDS management tools to perform CRUD operations on your schemas.
- Maintain schema definitions and changes in version control using SQL scripts.

## Version Control with Flyway
 Flyway is a powerful tool for managing database migrations and version control, allowing you to apply versioned changes to your database schema safely and reliably.

### Why Use Flyway?
- **Consistency:** Ensures all environments (development, staging, production) are in sync.
- **Automation:** Integrates with CI/CD pipelines to automate migrations.
- **Safety:** Allows rolling back changes in case of failures.
  
## Migration Workflow
1. **Create a Migration Script:** Add your SQL or Java-based migration scripts in the sql folder.

```bash
   V1__Initial_setup.sql
   V2__Add_users_table.sql
```

2. **Run Flyway Migrations:** Execute the migrations using Flyway.
```bash
   flyway migrate
```

3. **Check Migration Status:** Verify the status of applied migrations.
```bash
   flyway info
```
4. **Rollback (if needed):** To undo the last migration.

```bash
   flyway undo
```

## Best Practices
- **Version Control: Always commit your migration scripts to version control (e.g., Git).
- **Automate Migrations: Integrate Flyway into your CI/CD pipeline for automated deployments.
- **Test Migrations Locally: Before applying migrations in production, test them in a local or staging environment.
- **Backup Databases: Regularly backup your databases to prevent data loss during migrations.
- **Use Descriptive Names: Name your migration scripts descriptively to indicate their purpose (e.g., V2__Add_user_table.sql).
