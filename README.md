# CEIDTrip-DB
![MySQL](https://img.shields.io/badge/MySQL-4479A1?logo=mysql&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white)
![Bash](https://img.shields.io/badge/Bash-4EAA25?&logo=gnu-bash&logoColor=white)

A MySQL database designed to manage the operations of a travel agency. CEIDTrip-DB was developed as part of the 'Databases' course at the Computer Engineering and Informatics Department (CEID), University of Patras.

## Table of Contents

- [Project Descriprion](#project-description)
- [Database Schema Overview](#database-schema-overview)
- [Tech Stack](#tech-stack)
- [Installation](#installation)
- [CLI Automation & Container Management](#cli-automation--container-management)

## Project Description
This project aims to familiarize students with the creation and management of relational databases using MySQL. Our purpose in this project is to create a database for a travel agency. The travel agency operates different branches, employs various staff, and organizes trips and events. The database must contain the core tables for each primary entity along with some associative tables in order to handle the relationships between them. The core and junction tables we must create and use are as follows:
### Database Schema Overview

| Core Entity Tables | Junction Tables |
| :---: | :---: |
| `accomodation` | `accomodation_reservation` |
| `admin` | `db_admin_log` |
| `branch` | `language_ref` |
| `customer` | `manages` |
| `db_admin` | `reservation` |
| `destination` | `travel_to` |
| `driver` | `trip_log` |
| `event`|
| `guide` |
| `languages`  |
| `phones` |
| `trip` |
| `vehicle` | 
| `worker` |

### Project Architecture

```
|---database/
|   |---database_schema/            # Table definitions and constraints
|   |---database_seeding_scripts/   # Initial dataset insertion scripts
|   |---stored_procedures_scripts/  # Stored procedures 
|   |---triggers_scripts/           # Triggers used
|---docker-compose.yml              # Container service definition & volume mapping
|---docker.sh                       # CLI automation script for lifecycle management
```

## Tech Stack
**MySQL** serves as the primary relational database engine, managing normalized schemas, transactional integrity, and stored routines.  
**Docker & Docker Compose** containerizes the database infrastructure, providing reproducible runtime environments and zero-configuration local deployment.  
**Bash (Shell Scripting)** handles zero-touch initialization by automating startup health-checks, schema provisioning, and seed data execution.

## Installation

- Clone the repository

```bash 
git clone https://github.com/thomasnik1/CEIDTrip-DB.git
```
- Create a .env file based on the provided .env.sample file and populate it with your own variables.

- Ensure **docker.sh** is executable by running the following command: 
```bash
chmod +x docker.sh
```
**docker.sh** αutomates end-to-end container workflows by encapsulating routine Docker commands into a single CLI utility for building images, attaching interactive shells, terminating services, and streaming runtime logs.

## CLI Automation & Container Management
- Display all available **docker.sh** commands:
```bash
./docker.sh info
```

- Build and start the database container:
```bash
./docker.sh up
```
During the container build/startup, **init.sh** automates the execution of all DDL and DML scripts, leaving database fully initialized and ready for immediate use.
- Access the MySQL CLI:
```bash
./docker.sh shell
```
No manual credential entry is required, as all connection parameters are automatically loaded from the .env file.

- Tear down the container and reset the database:
```bash
./docker.sh down
```
This command stops and removes the container along with all associated volumes. Since schema provisioning and seed data are executed automatically on initialization, this ensures a clean, reproducible state for every run.

- **View container logs:**
```bash
  ./docker.sh logs
```
Monitors and streams real-time container logs, enabling quick inspection of database initialization and runtime queries.