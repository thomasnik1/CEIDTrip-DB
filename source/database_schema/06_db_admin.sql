CREATE TABLE db_admin (
	dba_id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	dba_username VARCHAR(50),
	dba_start_date DATETIME NOT NULL,
	dba_end_date DATETIME,
	dba_log TEXT
);

