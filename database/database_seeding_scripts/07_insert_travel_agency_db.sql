INSERT INTO branch (br_code, br_street, br_num, br_city) VALUES 
(1, 'Ermou', 15, 'Athens'),
(2, 'Tsimiski', 42, 'Thessaloniki'),
(3, 'Maizonos', 120, 'Patras');

INSERT INTO worker (wrk_AT, wrk_name, wrk_lname, wrk_email, wrk_salary, wrk_br_code) VALUES
('AT1001', 'George', 'Mazonakis', 'osozo@agency.gr', 1500.00, 1),
('AT1002', 'Walter', 'White', 'heisen@agency.gr', 1450.00, 1),
('AT1003', 'Jesse', 'Pinkman', 'jpink@agency.gr', 1300.00, 2),
('AT1004', 'Tuco', 'Salamanca', 'tsalam@agency.gr', 1350.00, 2),
('AT1005', 'Saul', 'Goodman', 'sgood@agency.gr', 1200.00, 3),
('AT2001', 'Jimmy', 'McGill', 'jmcgill@agency.gr', 1000.00, 1),
('AT2002', 'Chuck', 'McGill', 'chmcgill@agency.gr', 1100.00, 2),
('AT2003', 'Kim', 'Wexler', 'kwexler@agency.gr', 950.00, 3),
('AT2004', 'Huell', 'Babineaux', 'hbabin@agency.gr', 1050.00, 1),
('AT3001', 'Skyler', 'White', 'swhite@agency.gr', 1100.00, 1),
('AT3002', 'Mike', 'Ehrmantraut', 'mehrm@agency.gr', 1200.00, 2),
('AT3003', 'Gustavo', 'Fring', 'gfring@agency.gr', 1150.00, 3),
('AT3004', 'Skinny', 'Pete', 'spete@agency.gr', 1000.00, 1);

INSERT INTO admin (adm_AT, adm_type, adm_diploma) VALUES
('AT1001', 'ADMINISTRATIVE', 'MBA in Management'),
('AT1002', 'ACCOUNTING', 'Economics Degree'),
('AT1003', 'LOGISTICS', 'Supply Chain MSc'),
('AT1004', 'ADMINISTRATIVE', 'Business Admin BSc'),
('AT1005', 'LOGISTICS', 'Logistics Diploma');

UPDATE branch SET br_manager_AT = 'AT1001' WHERE br_code = 1;
UPDATE branch SET br_manager_AT = 'AT1003' WHERE br_code = 2;
UPDATE branch SET br_manager_AT = 'AT1005' WHERE br_code = 3;


INSERT INTO driver (drv_AT, drv_licence, drv_route, drv_experience) VALUES
('AT2001', 'C', 'LOCAL', 5),
('AT2002', 'D', 'ABROAD', 10),
('AT2003', 'B', 'LOCAL', 3),
('AT2004', 'D', 'ABROAD', 7);

INSERT INTO guide (gui_AT, gui_cv) VALUES
('AT3001', 'History Archaeology Degree, 5 years exp'),
('AT3002', 'Art History PhD, speaks 3 languages'),
('AT3003', 'Tourism Management BSc, local expert'),
('AT3004', 'European History Specialist');

INSERT INTO manages (mng_adm_AT, mng_br_code) VALUES
('AT1001', 1),
('AT1003', 2),
('AT1005', 3);

INSERT INTO phones (ph_br_code, ph_number) VALUES
(1, '2101234567'),
(1, '2107654321'),
(2, '2310987654'),
(2, '2310111222'),
(3, '2610555444');

INSERT INTO language_ref (lang_code, lang_name) VALUES
('EN', 'English'),
('FR', 'French'),
('DE', 'German');

INSERT INTO languages (lng_gui_AT, lng_language_code) VALUES
('AT3001', 'EN'),
('AT3001', 'FR'),
('AT3002', 'DE'),
('AT3003', 'EN');

INSERT INTO destination (dst_name, dst_descr, dst_rtype, dst_language_code, dst_location) VALUES
('Paris', 'The city of lights', 'ABROAD', 'FR', NULL),
('London', 'Capital of UK', 'ABROAD', 'EN', NULL),
('Berlin', 'Capital of Germany', 'ABROAD', 'DE', NULL),
('Meteora', 'Monasteries on rocks', 'LOCAL', NULL, NULL),
('Nafplio', 'First capital of Greece', 'LOCAL', NULL, NULL);

INSERT INTO trip (tr_departure, tr_return, tr_maxseats, tr_cost_adult, tr_cost_child, tr_status, tr_min_participants, tr_br_code, tr_gui_AT, tr_drv_AT, tr_kilometers_traveled) VALUES
('2024-06-01 08:00:00', '2024-06-05 20:00:00', 50, 500.00, 250.00, 'CONFIRMED', 10, 1, 'AT3001', 'AT2002', NULL), 
('2024-07-10 09:00:00', '2024-07-15 18:00:00', 40, 600.00, 300.00, 'PLANNED', 15, 1, 'AT3004', 'AT2004', NULL), 
('2024-08-01 07:00:00', '2024-08-04 22:00:00', 50, 450.00, 200.00, 'PLANNED', 12, 2, 'AT3002', 'AT2002', NULL), 
('2024-05-20 08:30:00', '2024-05-22 19:00:00', 30, 150.00, 75.00, 'COMPLETED', 8, 3, 'AT3003', 'AT2003', 120.34), 
('2024-09-15 09:00:00', '2024-09-17 17:00:00', 25, 120.00, 60.00, 'ACTIVE', 5, 3, 'AT3003', 'AT2001', NULL), 
('2024-12-20 10:00:00', '2024-12-26 20:00:00', 50, 700.00, 350.00, 'PLANNED', 20, 1, 'AT3001', 'AT2004', NULL), 
('2024-06-15 08:00:00', '2024-06-18 20:00:00', 45, 300.00, 150.00, 'CANCELED', 10, 2, 'AT3002', 'AT2002', NULL);

INSERT INTO travel_to (to_tr_id, to_dst_id, to_arrival, to_departure, to_sequence) VALUES
(1, 1, '2024-06-01 12:00:00', '2024-06-05 10:00:00', 1),
(2, 2, '2024-07-10 13:00:00', '2024-07-15 09:00:00', 1),
(3, 3, '2024-08-01 11:00:00', '2024-08-04 14:00:00', 1),
(4, 4, '2024-05-20 12:00:00', '2024-05-22 15:00:00', 1),
(5, 5, '2024-09-15 11:00:00', '2024-09-17 14:00:00', 1),
(6, 1, '2024-12-20 14:00:00', '2024-12-26 12:00:00', 1),
(7, 3, '2024-06-15 12:00:00', '2024-06-18 12:00:00', 1);

INSERT INTO event (ev_tr_id, ev_start, ev_end, ev_descr) VALUES
(1, '2024-06-02 10:00:00', '2024-06-02 14:00:00', 'Louvre Museum Visit'),
(2, '2024-07-11 11:00:00', '2024-07-11 15:00:00', 'British Museum Tour'),
(3, '2024-08-02 09:00:00', '2024-08-02 12:00:00', 'Brandenburg Gate Walk'),
(4, '2024-05-21 10:00:00', '2024-05-21 13:00:00', 'Monastery of Great Meteoron'),
(5, '2024-09-16 18:00:00', '2024-09-16 21:00:00', 'Palamidi Fortress Sunset'),
(6, '2024-12-24 19:00:00', '2024-12-24 23:00:00', 'Christmas Eve Dinner'),
(7, '2024-06-16 10:00:00', '2024-06-16 12:00:00', 'Berlin Wall Memorial');

INSERT INTO customer (cust_name, cust_lname, cust_email, cust_phone, cust_address, cust_birth_date) VALUES
('Hank', 'Schrader', 'hschra@mail.com', '6900000001', 'Cumbre Del Sur Ct 4901', '1980-05-10'),
('Bob', 'Squarepants', 'bsquare@mail.com', '6900000002', 'Antique Rd 2', '1985-06-15'),
('Patrick', 'Star', 'pstar@mail.com', '6900000003', 'Construction Ave 3', '1990-01-20'),
('Eugene', 'Krabs', 'eukrabs@mail.com', '6900000004', 'Magic Ln 4', '1975-11-30'),
('Mike', 'Hunt', 'mhunt@mail.com', '6900000005', 'Farm Rd 5', '1982-08-08'),
('Gabe', 'Itch', 'gitch@mail.com', '6900000006', 'German St 6', '1995-02-14'),
('Jack', 'Dove', 'jdove@mail.com', '6900000007', 'Casino Blvd 7', '1988-09-19'),
('Gregory', 'House', 'ghouse@mail.com', '6900000008', 'Baker St 221B', '1992-04-25'),
('James', 'Wilson', 'jwils@mail.com', '6900000009', 'Vault Dr 9', '1983-12-05'),
('Lisa', 'Cuddy', 'lcuddy@mail.com', '6900000010', 'Emergency Ln 10', '1998-07-07'),
('Dexter', 'Morgan', 'bbutch@mail.com', '6900000011', 'Apt 1155 103rd St', '1971-02-01'),
('Debrah', 'Morgan', 'dmorgan@mail.com', '6900000012', 'Apt 1588 2nd St', '1979-12-07'),
('Bruce', 'Wayne', 'notbatman@mail.com', '6900000013', 'Wayne Manor 1007 Mtn Dr', '1974-02-19');

INSERT INTO reservation (res_tr_id, res_seatnum, res_cust_id, res_status, res_total_cost) VALUES
(1, 1, 1, 'CONFIRMED', 500.00),
(1, 2, 2, 'CONFIRMED', 500.00),
(1, 3, 3, 'PENDING', 500.00),
(2, 1, 4, 'PAID', 600.00),
(2, 2, 5, 'PAID', 600.00),
(3, 10, 6, 'CONFIRMED', 450.00),
(4, 5, 7, 'CANCELED', 150.00),
(4, 6, 8, 'CONFIRMED', 150.00),
(5, 1, 9, 'CONFIRMED', 120.00),
(6, 15, 10, 'PENDING', 700.00),
(6, 16, 1, 'PAID', 700.00),
(6, 20, 1, 'CONFIRMED', 700.00),
(6, 21, 2, 'CONFIRMED', 700.00),
(6, 22, 3, 'CONFIRMED', 700.00),
(6, 23, 4, 'CONFIRMED', 700.00),
(6, 24, 5, 'CONFIRMED', 700.00),
(7, 1, 2, 'CANCELED', 0.00);

