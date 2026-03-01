DROP PROCEDURE IF EXISTS search_accomodation;

DELIMITER $

CREATE PROCEDURE search_accomodation(
	IN in_dst_id INT(11),
	IN in_acc_arrival DATETIME,
	IN in_acc_depart DATETIME,
	IN in_needed_rooms INT
)

BEGIN
	DECLARE destination_id INT(11);
	DECLARE accomodation_arrival DATETIME;
	DECLARE accomodation_departure DATETIME;
	DECLARE needed_rooms INT;
	
	SELECT to_dist_id, to_arrival, to_departure INTO destination_id, accomodation_arrival, accomodation_departure
	FROM travel_to
	WHERE to_dst_id = in_dst_id AND to_arriva
