DELIMITER $

DROP PROCEDURE IF EXISTS calculate_branch_earnings $

SET @profit = 0 $

CREATE PROCEDURE calculate_branch_earnings(
	IN in_br_code INT(11),
	OUT out_profit DECIMAL(10,4)
)

BEGIN
    DECLARE br_count INT;
    	DECLARE out_income DECIMAL(10, 2);
	DECLARE out_expenses DECIMAL(10, 2);
	DECLARE calc_profit DECIMAL(10, 4);
    
    SELECT count(*) INTO br_count 
    FROM branch 
    WHERE br_code = in_br_code;

    IF br_count = 0 THEN
        SET out_income = NULL;
        SET out_expenses = NULL;
        SET calc_profit = NULL;
    ELSE
        SELECT SUM(wrk_salary) INTO out_expenses
        FROM worker
        WHERE wrk_br_code = in_br_code;

        SELECT SUM(res.res_total_cost) INTO out_income
        FROM reservation res
        JOIN trip tr ON res.res_tr_id = tr.tr_id
        WHERE tr.tr_br_code = in_br_code;

        IF out_income is NULL THEN SET out_income = 0; END IF;
        IF out_expenses is NULL THEN SET out_expenses = 0; END IF;

        IF out_expenses > 0 THEN
            SET calc_profit = (out_income - out_expenses) / out_expenses;
        ELSE
            SET calc_profit = NULL; 
        END IF;
    END IF;
    	SET 	out_profit = calc_profit; 
END $

DELIMITER ;

CALL calculate_branch_earnings(1,@profit);

