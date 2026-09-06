CREATE TABLE db_admin (
	dba_id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	dba_username VARCHAR(50),
	dba_start_date DATETIME NOT NULL,
	dba_end_date DATETIME,
	dba_log TEXT
);

CREATE TABLE db_admin_log (
	dba_log_id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	dba_id INT(10) NOT NULL,
	dba_log_date DATETIME NOT NULL,
	dba_log_action VARCHAR(50) NOT NULL,
	dba_log_details TEXT,
	FOREIGN KEY (dba_id) REFERENCES db_admin(dba_id)
);
