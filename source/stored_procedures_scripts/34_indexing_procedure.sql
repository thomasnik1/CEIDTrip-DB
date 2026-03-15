DROP INDEX datetime_revenue_index ON trip_log;

SELECT sum(past_tr_revenue) 
    FROM trip_log 
    WHERE 
    past_tr_departure >= '2021-12-19' AND
    past_tr_return <= '2022-01-30';

CREATE INDEX datetime_revenue_index ON trip_log(past_tr_departure, past_tr_return, past_tr_revenue);

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
    past_tr_departure >= in_start_date AND
    past_tr_return <= in_end_date;
    
END $

DELIMITER ;

CALL profits_for_period('2021-12-19', '2022-01-30');


DROP INDEX destination_count_index ON trip_log;

SELECT past_tr_departure, past_tr_return
FROM trip_log
WHERE past_tr_dest_count = 5;

CREATE INDEX destination_count_index ON trip_log(past_tr_dest_count,past_tr_departure, past_tr_return);

DROP PROCEDURE IF EXISTS destination_count_match;

DELIMITER $

CREATE PROCEDURE destination_count_match(
    	IN in_dest_count INT
)

BEGIN

    SELECT past_tr_departure, past_tr_return
    FROM trip_log
    WHERE past_tr_dest_count = in_dest_count;
    
END $

DELIMITER ;

CALL destination_count_match(5);

