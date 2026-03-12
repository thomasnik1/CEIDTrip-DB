DROP PROCEDURE IF EXISTS search_accomodation;

DELIMITER $

CREATE PROCEDURE search_accomodation(
	IN in_dst_id INT(11),
	IN in_acc_arrival DATETIME,
	IN in_acc_departure DATETIME,
	IN in_needed_rooms INT
)

BEGIN
	DECLARE accomodation_id INT(11);
	DECLARE accomodation_name VARCHAR(100);
	DECLARE accomodation_type ENUM('HOTEL', 'GUESTHOUSE', 'RESORT', 'APARTMENT', 'RENTAL ROOM');
	DECLARE accomodation_street_num VARCHAR(50);
	DECLARE accomodation_phone VARCHAR(15);
	DECLARE accomodation_stars INT;
	DECLARE accomodation_score FLOAT(3,2);
	DECLARE accomodation_price FLOAT(10,2);
	DECLARE accomodation_services SET ('FREE WIFI', 'BAR/RESTAURANT', 'AIR CONDITIONING', 'WHEELCHAIR ACCESSIBLE');
	DECLARE accomodation_arrival DATETIME;
	DECLARE accomodation_departure DATETIME;
	DECLARE conflicts INT;
	
	DECLARE finished_flag INT;
	DECLARE accom_cursor CURSOR FOR
	
	SELECT
	accom_id, accom_name, accom_type, accom_street_num, accom_phone, accom_stars, accom_score, 
	accom_price, accom_services, acc_res_arrival, acc_res_departure
	FROM accomodation
	INNER JOIN accomodation_reservation ON accom_id = acc_res_to_acc_id
	WHERE
	accom_dest_id = in_dst_id AND
	accom_available_rooms >= in_needed_rooms;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished_flag = 1;
	
	DROP TEMPORARY TABLE IF EXISTS available_accomodations;
	CREATE TEMPORARY TABLE available_accomodations (
        temp_accomodation_name VARCHAR(100),
	    temp_accomodation_type ENUM('HOTEL', 'GUESTHOUSE', 'RESORT', 'APARTMENT', 'RENTAL ROOM'),
	    temp_accomodation_street_num VARCHAR(50),
	    temp_accomodation_phone VARCHAR(15),
	    temp_accomodation_stars INT,
	    temp_accomodation_score FLOAT(3,2),
	    temp_accomodation_price FLOAT(10,2),
	    temp_accomodation_services SET ('FREE WIFI', 'BAR/RESTAURANT', 'AIR CONDITIONING', 'WHEELCHAIR ACCESSIBLE')
	    );
	
	OPEN accom_cursor;
	SET finished_flag = 0;
	REPEAT
	
	FETCH accom_cursor INTO accomodation_id, accomodation_name, accomodation_type, accomodation_street_num, accomodation_phone, accomodation_stars, accomodation_score, accomodation_price, accomodation_services, accomodation_arrival, accomodation_departure;
	IF (finished_flag = 0) THEN
	
	SELECT count(*) INTO conflicts
	FROM accomodation_reservation
	WHERE acc_res_to_acc_id = accomodation_id
	AND acc_res_arrival < in_acc_departure
	AND acc_res_departure > in_acc_arrival;
	
	IF (conflicts = 0) THEN 
	    INSERT INTO available_accomodations VALUES (accomodation_name, accomodation_type, accomodation_street_num, accomodation_phone, accomodation_stars, accomodation_score, accomodation_price, accomodation_services) ;
	    END IF;
	END IF;
	UNTIL (finished_flag = 1)
	END REPEAT;
	CLOSE accom_cursor;
	
	SELECT DISTINCT * FROM available_accomodations ORDER BY temp_accomodation_price ASC;
	SELECT DISTINCT * FROM available_accomodations ORDER BY temp_accomodation_stars DESC;
	SELECT DISTINCT * FROM available_accomodations ORDER BY temp_accomodation_score DESC;
	DROP TEMPORARY TABLE available_accomodations;
END $

DELIMITER ;

CALL search_accomodation(1, '2026-01-01', '2026-01-05', 1);

