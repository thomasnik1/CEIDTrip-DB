DROP PROCEDURE IF EXISTS vehicle_reservation;

DELIMITER $

CREATE PROCEDURE vehicle_reservation (
	IN in_tr_id INT(11),
	IN in_ve_id INT(11),
    IN in_ve_mileage FLOAT(10,3)
)
BEGIN
    DECLARE vehicle_mileage FLOAT(10,3);
    DECLARE vehicle_state ENUM ('AVAILABLE', 'IN USE', 'UNDER MAINTENANCE');	
	DECLARE trip_confirmed_reservations INT;
	DECLARE vehicle_seats INT;
    DECLARE vehicle_driver CHAR(10);
    DECLARE driver_licence ENUM('A', 'B', 'C', 'D');
    DECLARE vehicle_type ENUM('CAR', 'VAN', 'MINIBUS', 'BUS');

	SELECT count(*) INTO trip_confirmed_reservations
	FROM trip 
	INNER JOIN reservation ON in_tr_id = reservation.res_tr_id
	WHERE tr_id = in_tr_id AND res_status = 'CONFIRMED';
	
	SELECT ve_seats, ve_state, ve_type, ve_mileage INTO vehicle_seats, vehicle_state, vehicle_type, vehicle_mileage
	FROM vehicle
	WHERE ve_id = in_ve_id;

    SELECT tr_drv_AT,drv_licence INTO vehicle_driver, driver_licence
    FROM trip
    INNER JOIN driver ON trip.tr_drv_AT = driver.drv_AT
    WHERE tr_id = in_tr_id;

	IF vehicle_seats < trip_confirmed_reservations THEN
	SIGNAL SQLSTATE VALUE '45000'
	SET MESSAGE_TEXT = 'Not enough seats in this vehicle';
    ELSEIF in_ve_mileage < vehicle_mileage THEN
	SIGNAL SQLSTATE VALUE '45000'
	SET MESSAGE_TEXT = 'Vehicle can not have less mileage than it already has';
	ELSEIF vehicle_state IN ('UNDER MAINTENANCE', 'IN USE') THEN
    SIGNAL SQLSTATE VALUE '45000'
	SET MESSAGE_TEXT = 'Vehicle is unavailable.';
	ELSEIF driver_licence IN ('A', 'B') AND vehicle_type IN('MINIBUS','BUS') THEN
    SIGNAL SQLSTATE VALUE '45000'
    SET MESSAGE_TEXT = 'Driver is not licensed to drive this vehicle';
    ELSE
	UPDATE vehicle
	SET ve_state = 'IN USE', ve_mileage = in_ve_mileage, ve_tr_id = in_tr_id
	WHERE ve_id = in_ve_id;
	END IF;

END $

DELIMITER ;
