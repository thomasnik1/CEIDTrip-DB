DROP PROCEDURE IF EXISTS vehicle_reservation;

DELIMITER $

CREATE PROCEDURE vehicle_reservation (
	IN in_tr_id INT(11),
	IN in_ve_id INT(11)
)

BEGIN
    DECLARE vehicle_state ENUM ('AVAILABLE', 'IN USE', 'UNDER MAINTENANCE');
	DECLARE vehicle_mileage FLOAT(10,3);
	DECLARE trip_confirmed_reservations INT;
	DECLARE vehicle_seats INT;
    DECLARE vehicle_driver CHAR(10);
    DECLARE driver_licence ENUM('A', 'B', 'C', 'D');
    DECLARE vehicle_type ENUM('CAR', 'VAN', 'MINIBUS', 'BUS');
	
	SELECT count(*) INTO trip_confirmed_reservations
	FROM trip 
	INNER JOIN reservation ON in_tr_id = reservation.res_tr_id
	WHERE tr_id = in_tr_id AND res_status = 'CONFIRMED';
	
	SELECT ve_seats, ve_state, ve_type, vehicle.ve_mileage INTO vehicle_seats, vehicle_state, vehicle_type, vehicle_mileage
	FROM vehicle
	WHERE ve_id = in_ve_id;

    SELECT tr_drv_AT,drv_licence INTO vehicle_driver, driver_licence
    FROM trip
    INNER JOIN driver ON tr_drv_AT = driver.drv_AT
    AND tr_id = in_tr_id;

	IF vehicle_seats < trip_confirmed_reservations THEN
	SIGNAL SQLSTATE VALUE '45000'
	SET MESSAGE_TEXT = 'Not enough seats in this vehicle';
	ELSEIF vehicle_state = 'UNDER MAINTENANCE' OR 'IN USE' THEN
    SIGNAL SQLSTATE VALUE '45000'
	SET MESSAGE_TEXT = 'Vehicle is unavailable.';
	ELSEIF driver_licence = 'A' OR 'B' AND vehicle_type = 'MINIBUS' OR 'BUS' THEN
    SIGNAL SQLSTATE VALUE '45000'
    SET MESSAGE_TEXT = 'Driver is not licensed to drive this vehicle';
    ELSE
	SELECT CONCAT(vehicle_mileage);
	END IF;

END $

DELIMITER ;

CALL vehicle_reservation(6, 5);

