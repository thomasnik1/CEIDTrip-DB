CREATE TABLE vehicle (
	ve_id INT(11) AUTO_INCREMENT PRIMARY KEY,
	ve_brand VARCHAR(50),
	ve_model VARCHAR(50),
	ve_lic_num VARCHAR(7) NOT NULL UNIQUE,
	ve_seats INT NOT NULL,
	ve_type ENUM('BUS', 'MINIBUS', 'VAN', 'CAR') NOT NULL,
	
	CONSTRAINT check_ve_type CHECK(
        (ve_type = 'BUS' AND ve_seats BETWEEN 21 AND 50) OR
        (ve_type = 'MINIBUS' AND ve_seats BETWEEN 10 AND 20) OR
        (ve_type = 'VAN' AND ve_seats BETWEEN 6 AND 9) OR
        (ve_type = 'BUS' AND ve_seats BETWEEN 1 AND 5)
    ),
	
	ve_state ENUM('AVAILABLE', 'IN USE', 'UNDER MAINTENANCE') NOT NULL,
	ve_mileage FLOAT(10,3),
	ve_tr_id INT(11) NOT NULL,
	FOREIGN KEY (ve_tr_id) REFERENCES trip(tr_id)
);

