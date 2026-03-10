DROP TRIGGER IF EXISTS reservation_price;

DELIMITER $

CREATE TRIGGER reservation_price 
BEFORE INSERT ON accomodation_reservation
FOR EACH ROW

BEGIN
    DECLARE price_per_day FLOAT(10.2);
    
    SELECT accom_price INTO price_per_day
    FROM accomodation
    WHERE accom_id = NEW.acc_res_to_acc_id;
    
    SET NEW.acc_res_total_stays = DATEDIFF(NEW.acc_res_departure, NEW.acc_res_arrival);
    SET NEW.acc_res_total_price = NEW.acc_res_rooms * NEW.acc_res_total_stays * price_per_day;
    
END $

DELIMITER ;

