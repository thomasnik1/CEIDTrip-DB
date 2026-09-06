CREATE TRIGGER trg_trip_insert AFTER INSERT ON trip FOR EACH ROW
INSERT INTO db_admin_log (dba_id, dba_log_date, dba_log_action, dba_log_details) VALUES (1, NOW(), 'INSERT', 'Table affected: trip');

CREATE TRIGGER trg_trip_update AFTER UPDATE ON trip FOR EACH ROW
INSERT INTO db_admin_log (dba_id, dba_log_date, dba_log_action, dba_log_details) VALUES (1, NOW(), 'UPDATE', 'Table affected: trip');

CREATE TRIGGER trg_trip_delete AFTER DELETE ON trip FOR EACH ROW
INSERT INTO db_admin_log (dba_id, dba_log_date, dba_log_action, dba_log_details) VALUES (1, NOW(), 'DELETE', 'Table affected: trip');


CREATE TRIGGER trg_reservation_insert AFTER INSERT ON reservation FOR EACH ROW
INSERT INTO db_admin_log (dba_id, dba_log_date, dba_log_action, dba_log_details) VALUES (1, NOW(), 'INSERT', 'Table affected: reservation');

CREATE TRIGGER trg_reservation_update AFTER UPDATE ON reservation FOR EACH ROW
INSERT INTO db_admin_log (dba_id, dba_log_date, dba_log_action, dba_log_details) VALUES (1, NOW(), 'UPDATE', 'Table affected: reservation');

CREATE TRIGGER trg_reservation_delete AFTER DELETE ON reservation FOR EACH ROW
INSERT INTO db_admin_log (dba_id, dba_log_date, dba_log_action, dba_log_details) VALUES (1, NOW(), 'DELETE', 'Table affected: reservation');


CREATE TRIGGER trg_customer_insert AFTER INSERT ON customer FOR EACH ROW
INSERT INTO db_admin_log (dba_id, dba_log_date, dba_log_action, dba_log_details) VALUES (1, NOW(), 'INSERT', 'Table affected: customer');

CREATE TRIGGER trg_customer_update AFTER UPDATE ON customer FOR EACH ROW
INSERT INTO db_admin_log (dba_id, dba_log_date, dba_log_action, dba_log_details) VALUES (1, NOW(), 'UPDATE', 'Table affected: customer');

CREATE TRIGGER trg_customer_delete AFTER DELETE ON customer FOR EACH ROW
INSERT INTO db_admin_log (dba_id, dba_log_date, dba_log_action, dba_log_details) VALUES (1, NOW(), 'DELETE', 'Table affected: customer');


CREATE TRIGGER trg_destination_insert AFTER INSERT ON destination FOR EACH ROW
INSERT INTO db_admin_log (dba_id, dba_log_date, dba_log_action, dba_log_details) VALUES (1, NOW(), 'INSERT', 'Table affected: destination');

CREATE TRIGGER trg_destination_update AFTER UPDATE ON destination FOR EACH ROW
INSERT INTO db_admin_log (dba_id, dba_log_date, dba_log_action, dba_log_details) VALUES (1, NOW(), 'UPDATE', 'Table affected: destination');

CREATE TRIGGER trg_destination_delete AFTER DELETE ON destination FOR EACH ROW
INSERT INTO db_admin_log (dba_id, dba_log_date, dba_log_action, dba_log_details) VALUES (1, NOW(), 'DELETE', 'Table affected: destination');


CREATE TRIGGER trg_vehicle_insert AFTER INSERT ON vehicle FOR EACH ROW
INSERT INTO db_admin_log (dba_id, dba_log_date, dba_log_action, dba_log_details) VALUES (1, NOW(), 'INSERT', 'Table affected: vehicle');

CREATE TRIGGER trg_vehicle_update AFTER UPDATE ON vehicle FOR EACH ROW
INSERT INTO db_admin_log (dba_id, dba_log_date, dba_log_action, dba_log_details) VALUES (1, NOW(), 'UPDATE', 'Table affected: vehicle');

CREATE TRIGGER trg_vehicle_delete AFTER DELETE ON vehicle FOR EACH ROW
INSERT INTO db_admin_log (dba_id, dba_log_date, dba_log_action, dba_log_details) VALUES (1, NOW(), 'DELETE', 'Table affected: vehicle');


CREATE TRIGGER trg_accomodation_insert AFTER INSERT ON accomodation FOR EACH ROW
INSERT INTO db_admin_log (dba_id, dba_log_date, dba_log_action, dba_log_details) VALUES (1, NOW(), 'INSERT', 'Table affected: accomodation');

CREATE TRIGGER trg_accomodation_update AFTER UPDATE ON accomodation FOR EACH ROW
INSERT INTO db_admin_log (dba_id, dba_log_date, dba_log_action, dba_log_details) VALUES (1, NOW(), 'UPDATE', 'Table affected: accomodation');

CREATE TRIGGER trg_accomodation_delete AFTER DELETE ON accomodation FOR EACH ROW
INSERT INTO db_admin_log (dba_id, dba_log_date, dba_log_action, dba_log_details) VALUES (1, NOW(), 'DELETE', 'Table affected: accomodation');


CREATE TRIGGER trg_acc_res_insert AFTER INSERT ON accomodation_reservation FOR EACH ROW
INSERT INTO db_admin_log (dba_id, dba_log_date, dba_log_action, dba_log_details) VALUES (1, NOW(), 'INSERT', 'Table affected: accomodation_reservation');

CREATE TRIGGER trg_acc_res_update AFTER UPDATE ON accomodation_reservation FOR EACH ROW
INSERT INTO db_admin_log (dba_id, dba_log_date, dba_log_action, dba_log_details) VALUES (1, NOW(), 'UPDATE', 'Table affected: accomodation_reservation');

CREATE TRIGGER trg_acc_res_delete AFTER DELETE ON accomodation_reservation FOR EACH ROW
INSERT INTO db_admin_log (dba_id, dba_log_date, dba_log_action, dba_log_details) VALUES (1, NOW(), 'DELETE', 'Table affected: accomodation_reservation');
