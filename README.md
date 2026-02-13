t# CEIDTrip-DB
A MySQL database designed to manage the operations of a travel agency. CEIDTrip-DB was developed as part of the 'Databases' course at the Computer Engineering and Informatics Department (CEID), University of Patras.

## Project Description
This project aims to familiarize students with the creation and .. of relational databases using MySQL. In this project we are called to create a database for a travel agency. The travel agency contains different branches, staff and organizes trips and events. The database must contain the required tables for each of these .. along with some .. tables in order for .. . The tables we must create and use are as follows:
- admin
- branch
- customer
- destination
- driver
- event
- guide
- language_ref
- languages
- manages
- phones
- reservation
- travel_to
- trip
- worker

## Technologies Used
**Database**: MySQL was used in order to build the database.

## Docker Commands
Use ```sudo docker compose up -d``` to build the container. The database will already be initialized.<br>
Use ```sudo docker exec -it ceidtrip-db mysql -u root -p``` to enter container in MySQL cli.<br>
Enter root password. (```password```)
Use ```sudo docker compose down -v``` in order to shut down the docker container and remove any data.
