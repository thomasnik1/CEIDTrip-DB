CREATE INDEX datetime_revenue_index ON trip_log(past_tr_departure, past_tr_return, past_tr_revenue);

CREATE INDEX destination_count_index ON trip_log(past_tr_dest_count,past_tr_departure, past_tr_return) USING HASH;