CREATE TABLE accomodation_reservation (
	acc_res_id INT AUTO_INCREMENT PRIMARY KEY,
	acc_res_to_acc_id INT(11),
	acc_res_arrival DATETIME NOT NULL,
	acc_res_departure DATETIME NOT NULL,
	acc_res_rooms INT,
	acc_res_total_stays INT,
	acc_res_total_price FLOAT(10.2),
	FOREIGN KEY (acc_res_to_acc_id) REFERENCES accomodation(accom_id)
);

