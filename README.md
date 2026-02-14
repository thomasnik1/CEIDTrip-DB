# CEIDTrip-DB
A MySQL database designed to manage the operations of a travel agency. CEIDTrip-DB was developed as part of the 'Databases' course at the Computer Engineering and Informatics Department (CEID), University of Patras.

## Project Description
This project aims to familiarize students with the creation and management of relational databases using MySQL. Our purpose in this project is to create a database for a travel agency. The travel agency is operates different branches, employs various staff, and organizes trips and events. The database must contain the core tables for each primary entity along with some associative tables in order to handle the relationships between them. The core and junction tables we must create and use are as follows:
### Database Schema Overview

| Core Entity Tables | Junction Tables |
| :---: | :---: |
| `admin` | `manages` |
| `branch` | `phones` |
| `customer` | `reservation` |
| `destination` | `travel_to` |
| `driver` | `language_ref` |
| `event` | `languages` |
| `guide` | |
| `trip` | |
| `worker` | |

## Technologies Used
**Database**: **MySQL** was used in order to build the database.<br>
**Containerization**: **Docker & Docker Compose** were used in order to simplify the setup process and ensure environment stability and consistency across different systems.

## Docker Commands
Use ```sudo docker compose up -d``` to build the container. The database will already be initialized.<br>
Use ```sudo docker exec -it ceidtrip-db mysql -u root -p``` to enter the container's MySQL CLI.<br>
Enter root password. (```password```) <br>
Use ```sudo docker compose down -v``` in order to shut down the docker container and delete all data. Since all the data and MySQL scripts are loaded when the container is built, we use this command so we can start fresh every time.
