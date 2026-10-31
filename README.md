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
- [Docker Management](#docker-management)

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

## Tech Stack
**Database**: **MySQL** was used in order to build the database.<br>
**Containerization**: **Docker & Docker Compose** were used in order to simplify the setup process and ensure environment stability and consistency across different systems.<br>
**Automation**: **Bash (Shell Scripting)** was used to manage the container and database seeding.

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
**docker.sh** is used to automate the process of building, entering and stopping the container. It can also be used to show the docker images and logs.

## Docker Management
- To display the available **docker.sh** commands run:
```bash
./docker.sh info
```

- Use the following command to build the container:
```bash
./docker.sh up
```
During the building of the container, **init.sh** is being executed which runs all the loading and seeding scipts so the database will already be initialized.<br>
- To enter MySQL CLI, use:
```bash
./docker.sh shell
```
You won't have to enter any credentials as they are being entered by the .env file.

- To shut down the docker container and delete all the data, use:
```bash
./docker.sh down
```
Since all the data and MySQL scripts are loaded when the container is built, we use this command in order to start fresh every time.
