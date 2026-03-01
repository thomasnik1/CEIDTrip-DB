CREATE TABLE accomodation(
	accom_id INT(11) AUTO_INCREMENT PRIMARY KEY,
	accom_name VARCHAR(100),
	accom_type ENUM('HOTEL', 'GUESTHOUSE', 'RESORT', 'APARTMENT', 'RENTAL ROOM'),
	accom_stars INT DEFAULT NULL,
	
	CONSTRAINT chcek_star_rating CHECK(
	    (accom_type IN ('HOTEL', 'RESORT') AND accom_stars BETWEEN 1 AND 5) OR
	    (accom_type NOT IN('HOTEL', 'RESORT') AND accom_stars IS NULL)
	),
	
	accom_score FLOAT(3,2) NOT NULL,
	accom_state BOOLEAN,
	accom_street_num VARCHAR(50),
    accom_city VARCHAR(100),
    accom_postal_code INT(5),
	accom_max_rooms INT(5) UNSIGNED NOT NULL,
	accom_available_rooms INT(5) UNSIGNED NOT NULL,
	
	CONSTRAINT check_rooms CHECK(
	    (accom_max_rooms >= accom_available_rooms)
	),
	
	accom_price FLOAT(10,2) NOT NULL,
	accom_services SET ('FREE WIFI', 'BAR/RESTAURANT', 'AIR CONDITIONING', 'WHEELCHAIR ACCESSIBLE'),
	accom_dest_id INT(11) NOT NULL,
	FOREIGN KEY (accom_dest_id) REFERENCES destination(dst_id)
);

