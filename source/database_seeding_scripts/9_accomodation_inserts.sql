INSERT INTO accomodation (
    accom_id, accom_name, accom_type, accom_stars, accom_score, 
	accom_state, accom_street_num, accom_city, accom_postal_code,
    accom_max_rooms, accom_available_rooms, accom_price,
    accom_services, accom_dest_id
) VALUES
(1,'Hotel de Lumière', 'HOTEL', 5, 4.8, 1, '12 Rue de Rivoli', 'Paris', 75001, 45, 45, 450.00, 'FREE WIFI,BAR/RESTAURANT,AIR CONDITIONING,WHEELCHAIR ACCESSIBLE', 1),
(2, 'Montmartre Studio', 'APARTMENT', NULL, 4.2, 1, '45 Rue Lepic', 'Paris', 75018, 1, 1, 120.00, 'FREE WIFI,AIR CONDITIONING', 1),
(3, 'The Thames Resort', 'RESORT', 4, 4.5, 1, '22 Southbank', 'London', 12345, 120, 80, 310.00, 'FREE WIFI,BAR/RESTAURANT,WHEELCHAIR ACCESSIBLE', 2),
(4, 'Paddington Stay', 'RENTAL ROOM', NULL, 3.9, 1, '88 Gloucester Terrace', 'London', 54321, 10, 3, 85.00, 'FREE WIFI', 2),
('Berlin Grand Hotel', 'HOTEL', 4, 4.6, 1, 'Unter den Linden 77', 'Berlin', 10117, 200, 120, 195.00, 'FREE WIFI,BAR/RESTAURANT,AIR CONDITIONING,WHEELCHAIR ACCESSIBLE', 3),
(5, 'Alexanderplatz Loft', 'APARTMENT', NULL, 4.7, 1, 'Karl-Liebknecht-Str 5', 'Berlin', 10178, 2, 2, 150.00, 'FREE WIFI,AIR CONDITIONING', 3),
(6, 'Meteora Rocks Guesthouse', 'GUESTHOUSE', NULL, 4.9, 1, 'Kalabaka Main Road', 'Meteora', 42200, 8, 7, 75.00, 'FREE WIFI,AIR CONDITIONING', 4),
(7, 'Monastery View Resort', 'RESORT', 5, 4.8, 1, 'Kastraki Village', 'Meteora', 42200, 30, 12, 210.00, 'FREE WIFI,BAR/RESTAURANT,AIR CONDITIONING', 4),
(8, 'Palamidi Vista', 'HOTEL', 3, 4.4, 1, 'Staikopoulou 15', 'Nafplio', 21100, 25, 23, 110.00, 'FREE WIFI,AIR CONDITIONING,WHEELCHAIR ACCESSIBLE', 5),
(9, 'Old Town Sanctuary', 'RENTAL ROOM', NULL, 4.5, 1, 'Bouboulinas 4', 'Nafplio', 21100, 5, 5, 65.00, 'FREE WIFI', 5);

