DROP INDEX datetime_revenue_index ON trip_log;

 SELECT sum(past_tr_revenue) 
    FROM trip_log 
    WHERE 
    past_tr_departure >= '2021-12-28' AND
    past_tr_return <= '2022-01-30';

CREATE INDEX datetime_revenue_index ON trip_log(past_tr_departure, past_tr_return, past_tr_revenue);

 SELECT sum(past_tr_revenue) 
    FROM trip_log 
    WHERE 
    past_tr_departure >= '2021-12-28' AND
    past_tr_return <= '2022-01-30';



DROP INDEX destination_count_index ON trip_log;

SELECT past_tr_departure, past_tr_return
FROM trip_log
WHERE past_tr_dest_count = 5;

CREATE INDEX destination_count_index ON trip_log(past_tr_dest_count,past_tr_departure, past_tr_return) USING HASH;

SELECT past_tr_departure, past_tr_return
FROM trip_log
WHERE past_tr_dest_count = 5;