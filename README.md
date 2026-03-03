# CEIDTrip-DB
A MySQL database designed to manage the operations of a travel agency. CEIDTrip-DB was developed as part of the 'Databases' course at the Computer Engineering and Informatics Department (CEID), University of Patras.

## Project Description
This project aims to familiarize students with the creation and management of relational databases using MySQL. Our purpose in this project is to create a database for a travel agency. The travel agency operates different branches, employs various staff, and organizes trips and events. The database must contain the core tables for each primary entity along with some associative tables in order to handle the relationships between them. The core and junction tables we must create and use are as follows:
### Database Schema Overview

| Core Entity Tables | Junction Tables |
| :---: | :---: |
| `accomodation` | `accomodation_reservation` |
| `admin` | `language_ref` |
| `branch` | `manages` |
| `customer` | `reservation` |
| `dba` | `travel_to` |
| `destination` |  `trip_log` |
| `driver` | `db_admin`|
| `event` |
| `guide` |
| `languages` |
| `phones` |
| `trip` | 
| `vehicle` |
| `worker` | 

## Technologies Used
**Database**: **MySQL** was used in order to build the database.<br>
**Containerization**: **Docker & Docker Compose** were used in order to simplify the setup process and ensure environment stability and consistency across different systems.<br>
**Automation**: **Bash (Shell Scripting)** was used to manage the container and database seeding.

## Getting Started
Ensure **docker.sh** is executable by running the following command: 
```bash
chmod +x docker.sh
```
**docker.sh** is used to automate the process of building, entering and stopping the container. It can also be used to show the docker images and the logs.

## Docker Management
Use the following command to build the container:
```bash
./docker.sh up
```
The database will already be initialized.<br>
To enter MySQL CLI, use:
```bash
./docker.sh shell
```
To shut down the docker container and delete all the data, use:
```bash
./docker.sh down
```
Since all the data and MySQL scripts are loaded when the container is built, we use this command in order to start fresh every time.
