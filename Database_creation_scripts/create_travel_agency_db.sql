USE travel_agency;

CREATE TABLE branch (
    br_code INT(11) AUTO_INCREMENT PRIMARY KEY,
    br_street VARCHAR(50),
    br_num INT(4),
    br_city VARCHAR(30)
);


CREATE TABLE phones (
    ph_br_code INT(11),
    ph_number VARCHAR(15),
    PRIMARY KEY (ph_br_code, ph_number),
    FOREIGN KEY (ph_br_code) REFERENCES branch(br_code) ON DELETE CASCADE
);

CREATE TABLE worker (
    wrk_AT CHAR(10) PRIMARY KEY,
    wrk_name VARCHAR(30) NOT NULL,
    wrk_lname VARCHAR(30) NOT NULL,
    wrk_email VARCHAR(100),
    wrk_salary DECIMAL(10, 2),
    wrk_br_code INT(11) NOT NULL,
    FOREIGN KEY (wrk_br_code) REFERENCES branch(br_code)
);

CREATE TABLE driver (
    drv_AT CHAR(10) PRIMARY KEY,
    drv_licence ENUM('A', 'B', 'C', 'D') NOT NULL,
    drv_route ENUM('LOCAL', 'ABROAD') NOT NULL,
    drv_experience TINYINT(4),
    FOREIGN KEY (drv_AT) REFERENCES worker(wrk_AT) ON DELETE CASCADE
);

CREATE TABLE language_ref (
    lang_code VARCHAR(5) PRIMARY KEY,
    lang_name VARCHAR(50) UNIQUE
);

CREATE TABLE guide (
    gui_AT CHAR(10) PRIMARY KEY,
    gui_cv TEXT,
    FOREIGN KEY (gui_AT) REFERENCES worker(wrk_AT) ON DELETE CASCADE
);

CREATE TABLE languages (
    lng_gui_AT CHAR(10),
    lng_language_code VARCHAR(5),
    PRIMARY KEY (lng_gui_AT, lng_language_code),
    FOREIGN KEY (lng_gui_AT) REFERENCES guide(gui_AT) ON DELETE CASCADE,
    FOREIGN KEY (lng_language_code) REFERENCES language_ref(lang_code)
);

CREATE TABLE admin (
    adm_AT CHAR(10) PRIMARY KEY,
    adm_type ENUM('LOGISTICS', 'ADMINISTRATIVE', 'ACCOUNTING') NOT NULL,
    adm_diploma VARCHAR(200),
    FOREIGN KEY (adm_AT) REFERENCES worker(wrk_AT) ON DELETE CASCADE
);

ALTER TABLE branch
ADD COLUMN br_manager_AT CHAR(10),
ADD CONSTRAINT fk_branch_manager FOREIGN KEY (br_manager_AT) REFERENCES admin(adm_AT);

CREATE TABLE customer (
    cust_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    cust_name VARCHAR(30) NOT NULL,
    cust_lname VARCHAR(30) NOT NULL,
    cust_email VARCHAR(100),
    cust_phone VARCHAR(15),
    cust_address TEXT,
    cust_birth_date DATE NOT NULL
);

CREATE TABLE trip (
    tr_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    tr_departure DATETIME NOT NULL,
    tr_return DATETIME NOT NULL,
    tr_maxseats TINYINT(4) NOT NULL,
    tr_cost_adult DECIMAL(10, 2) NOT NULL,
    tr_cost_child DECIMAL(10, 2) NOT NULL,
    tr_status ENUM('PLANNED', 'CONFIRMED', 'ACTIVE', 'COMPLETED', 'CANCELED') DEFAULT 'PLANNED',
    tr_min_participants TINYINT(4),
    tr_br_code INT(11) NOT NULL,
    tr_gui_AT CHAR(10) NOT NULL,
    tr_drv_AT CHAR(10) NOT NULL,
    FOREIGN KEY (tr_br_code) REFERENCES branch(br_code),
    FOREIGN KEY (tr_gui_AT) REFERENCES guide(gui_AT),
    FOREIGN KEY (tr_drv_AT) REFERENCES driver(drv_AT)
);

CREATE TABLE destination (
    dst_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    dst_name VARCHAR(100) NOT NULL,
    dst_descr TEXT,
    dst_rtype ENUM('LOCAL', 'ABROAD') NOT NULL,
    dst_language_code VARCHAR(5),
    dst_location INT(11), 
    FOREIGN KEY (dst_language_code) REFERENCES language_ref(lang_code),
    FOREIGN KEY (dst_location) REFERENCES destination(dst_id)
);

CREATE TABLE travel_to (
    to_tr_id INT(11),
    to_dst_id INT(11),
    to_arrival DATETIME,
    to_departure DATETIME,
    to_sequence TINYINT(4),
    PRIMARY KEY (to_tr_id, to_dst_id),
    FOREIGN KEY (to_tr_id) REFERENCES trip(tr_id) ON DELETE CASCADE,
    FOREIGN KEY (to_dst_id) REFERENCES destination(dst_id)
);

CREATE TABLE event (
    ev_tr_id INT(11),
    ev_start DATETIME NOT NULL,
    ev_end DATETIME NOT NULL,
    ev_descr TEXT,
    PRIMARY KEY(	ev_tr_id, ev_start),
    FOREIGN KEY (ev_tr_id) REFERENCES trip(tr_id) ON DELETE CASCADE
);

CREATE TABLE reservation (
    res_tr_id INT(11),
    res_seatnum TINYINT(4),
    res_cust_id INT(11) NOT NULL,
    res_status ENUM('PENDING', 'CONFIRMED', 'PAID', 'CANCELED') DEFAULT 'PENDING',
    res_total_cost DECIMAL(10, 2),
    PRIMARY KEY (res_tr_id, res_seatnum),
    FOREIGN KEY (res_tr_id) REFERENCES trip(tr_id) ON DELETE CASCADE,
    FOREIGN KEY (res_cust_id) REFERENCES customer(cust_id)
);

CREATE TABLE manages (
	mng_adm_AT CHAR(10),
	mng_br_code INT(11),
	PRIMARY KEY (mng_adm_AT, mng_br_code),
	FOREIGN KEY (mng_adm_AT) REFERENCES admin(adm_AT) ON DELETE CASCADE,
	FOREIGN KEY (mng_br_code) REFERENCES branch(br_code)
);

