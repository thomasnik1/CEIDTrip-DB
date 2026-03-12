DROP TRIGGER IF EXISTS vehicle_updater;

DELIMITER $

CREATE TRIGGER vehicle_updater 
AFTER UPDATE ON trip
FOR EACH ROW

BEGIN
    IF NEW.tr_status = 'COMPLETED' THEN
    
    DECLARE kilometers_traveled FLOAT (10,3);
    SELECT 
    
    	


