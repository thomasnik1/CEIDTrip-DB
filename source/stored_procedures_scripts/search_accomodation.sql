DROP PROCEDURE IF EXISTS search_accomodation;

DELIMITER $

CREATE PROCEDURE search_accomodation(
	IN in_dst_id INT(11),
	IN in_acc_arrival DATETIME,
	IN in_acc_depart DATETIME,
	IN in_needed_rooms INT
)

BEGIN

	SELECT DISTINCT
	accomodation.accom_name, accomodation.accom_type, accomodation.accom_street_num, 
	accomodation.accom_phone, accomodation.accom_stars, accomodation.accom_score, 
	accomodation.accom_price, accomodation.accom_services
	FROM accomodation_reservation
	INNER JOIN accomodation ON accom_id = acc_res_to_acc_id
	INNER JOIN destination ON accom_dest_id = dst_id
	WHERE
	in_dst_id = dst_id AND
	in_acc_arrival NOT BETWEEN acc_res_arrival AND acc_res_departure AND
	in_acc_depart NOT BETWEEN acc_res_arrival AND acc_res_departure AND
	in_needed_rooms < accom_available_rooms;
END $

DELIMITER ;

CALL search_accomodation(1, '2024-03-04', '2024-03-07', 8);


select accom_id, accom_name, accom_dest_id from accomodation
inner join accomodation_reservation on accom_id = accomodation_reservation.acc_res_to_acc_id
