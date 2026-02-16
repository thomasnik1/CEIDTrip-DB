DROP PROCEDURE IF EXISTS vehicle_reservation;

DELIMITER $

CREATE PROCEDURE vehicle_reservation (
	IN in_tr_id INT(11),
	IN in_ve_id INT(11)
)

BEGIN
	DECLARE trip_id INT(11);
	DECLARE vehicle_id INT(11);
	DECLARE vehicle_mileage FLOAT(10,3);
	DECLARE trip_confirmed_reservations INT;
	DECLARE 	vehicle_seats INT;
	
	SELECT count(*) INTO trip_confirmed_reservations
	FROM trip 
	INNER JOIN reservation ON in_tr_id = reservation.res_tr_id
	WHERE tr_id = in_tr_id;
	
	SELECT ve_seats INTO vehicle_seats
	FROM vehicle
	WHERE ve_id = in_ve_id;
	
	IF (vehicle_seats < trip_confirmed_reservations) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Not enough seats in this vehicle';
	ELSE 
		SELECT CONCAT('ALL GOOD HOMIE');
	END IF;
	
END $

DELIMITER ;

CALL vehicle_reservation(1);

