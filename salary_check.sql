DELIMITER $

DROP TRIGGER IF EXISTS salary_check $

CREATE TRIGGER salary_check
BEFORE UPDATE ON worker
FOR EACH ROW
BEGIN
    DECLARE in_profit DECIMAL(10, 4);

    IF NEW.wrk_salary > OLD.wrk_salary THEN
        
        CALL calculate_branch_earnings(OLD.wrk_br_code, in_profit);

        IF in_profit IS NULL OR in_profit < 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Salary increase denied: The branch is operating at a loss or does not exist.';
        
        ELSE
            IF NEW.wrk_salary > (OLD.wrk_salary * 1.02) THEN
                SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Salary increase denied: The increase exceeds the 2% limit for profitable branches.';
            END IF;
        END IF;

    END IF;
END $

DELIMITER ;

