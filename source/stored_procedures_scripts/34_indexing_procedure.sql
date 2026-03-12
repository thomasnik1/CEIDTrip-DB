DROP INDEX indx ON trip_log;

SELECT sum(past_tr_revenue) 
    FROM trip_log 
    WHERE 
    past_tr_departure < '2021-05-09' AND
    past_tr_return > '2021-05-20';

CREATE INDEX indx ON trip_log(past_tr_departure, past_tr_return);

DROP PROCEDURE IF EXISTS profits_for_period;

DELIMITER $

CREATE PROCEDURE profits_for_period(
    IN in_start_date DATETIME,
    IN in_end_date DATETIME
)

BEGIN

    SELECT sum(past_tr_revenue) 
    FROM trip_log 
    WHERE 
    past_tr_departure < in_start_date AND
    past_tr_return > in_end_date;
    
END $

DELIMITER ;

CALL profits_for_period('2021-05-09', '2021-05-20');

