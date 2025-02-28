-- CS4400: Introduction to Database Systems (Spring 2025)
-- Phase II: Create Table & Insert Statements [v0] Monday, February 3, 2025 @ 17:00 EST

-- Team __
-- Andrew Leng 903832819
-- Darnell Chen dchen458
-- Nicole Li nli319
-- Team Member Name (GT username)

-- Directions:
-- Please follow all instructions for Phase II as listed on Canvas.
-- Fill in the team number and names and GT usernames for all members above.
-- Create Table statements must be manually written, not taken from an SQL Dump file.
-- This file must run without error for credit.

/* This is a standard preamble for most of our scripts.  The intent is to establish
a consistent environment for the database behavior. */
set global transaction isolation level serializable;
set global SQL_MODE = 'ANSI,TRADITIONAL';
set names utf8mb4;
set SQL_SAFE_UPDATES = 0;

set @thisDatabase = 'airline_management';
drop database if exists airline_management;
create database if not exists airline_management;
use airline_management;

-- Define the database structures
/* You must enter your tables definitions, along with your primary, unique and foreign key
declarations, and data insertion statements here.  You may sequence them in any order that
works for you.  When executed, your statements must create a functional database that contains
all of the data, and supports as many of the constraints as reasonably possible. */

-- Table Definitions
-- Updated schema with correct data types and lengths

CREATE TABLE location (
    locationID VARCHAR(50) PRIMARY KEY
);

INSERT INTO location (locationID) VALUES
('port_1'),('port_2'),('port_3'),('port_4'),('port_6'),('port_7'),('port_10'),
('port_11'),('port_12'),('port_13'),('port_14'),('port_15'),('port_16'),('port_17'),
('port_18'),('port_20'),('port_21'),('port_22'),('port_23'),('port_24'),('port_25'),
('plane_1'),('plane_2'),('plane_3'),('plane_4'),('plane_5'),('plane_6'),('plane_7'),
('plane_8'),('plane_10'),('plane_13'),('plane_18'),('plane_20');

CREATE TABLE route (
    routeID VARCHAR(50) PRIMARY KEY
);

INSERT INTO route (routeID) VALUES
('americas_hub_exchange'),
('americas_one'),
('americas_three'),
('americas_two'),
('big_europe_loop'),
('euro_north'),
('euro_south'),
('germany_local'),
('pacific_rim_tour'),
('south_euro_loop'),
('texas_local'),
('korea_direct');

CREATE TABLE airline (
    airlineID VARCHAR(50) PRIMARY KEY,
    revenue INT CHECK (REVENUE > 0)
);

INSERT INTO airline (airlineID, revenue) VALUES
('Delta', 53000),
('United', 48000),
('British Airways', 24000),
('Lufthansa', 35000),
('Air_France', 29000),
('KLM', 29000),
('Ryanair', 10000),
('Japan Airlines', 9000),
('China Southern Airlines', 14000),
('Korean Air Lines', 10000),
('American', 52000);

CREATE TABLE flight (
    flightID VARCHAR(50) NOT NULL PRIMARY KEY,
    cost INT NOT NULL,
    routeID VARCHAR(50),
	FOREIGN KEY (routeID) REFERENCES route(routeID)
);

INSERT INTO flight (flightID, cost, RouteID) VALUES
('dl_10', 200, 'americas_one'),
('un_38', 200, 'americas_three'),
('ba_61', 200, 'americas_two'),
('lf_20', 300, 'euro_north'),
('km_16', 400, 'euro_south'),
('ba_51', 100, 'big_europe_loop'),
('ja_35', 300, 'pacific_rim_tour'),
('ry_34', 100, 'germany_local'),
('aa_12', 150, 'americas_hub_exchange'),
('dl_42', 220, 'texas_local'),
('ke_64', 500, 'korea_direct'),
('lf_67', 900, 'euro_north');

CREATE TABLE person (
    personID VARCHAR(50) PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    locationID VARCHAR(50),
	FOREIGN KEY (locationID) REFERENCES location(locationID)
);

INSERT INTO person (personID, first_name, last_name, locationID) VALUES
('p1', 'Jeanne', 'Nelson', 'port_1'),
('p2', 'Roxanne', 'Byrd', 'port_1'),
('p11', 'Sandra', 'Cruz', 'port_3'),
('p13', 'Bryant', 'Figueroa', 'port_3'),
('p14', 'Dana', 'Perry', 'port_3'),
('p15', 'Matt', 'Hunt', 'port_10'),
('p16', 'Edna', 'Brown', 'port_10'),
('p12', 'Dan', 'Ball', 'port_3'),
('p17', 'Ruby', 'Burgess', 'plane_3'),
('p18', 'Esther', 'Pittman', 'plane_10'),
('p19', 'Doug', 'Fowler', 'port_17'),
('p8', 'Bennie', 'Palmer', 'port_2'),
('p20', 'Thomas', 'Olson', 'port_17'),
('p21', 'Mona', 'Harrison', 'plane_1'),
('p22', 'Arlene', 'Massey', 'plane_1'),
('p23', 'Judith', 'Patrick', 'plane_1'),
('p24', 'Reginald', 'Rhodes', 'plane_5'),
('p25', 'Vincent', 'Garcia', 'plane_5'),
('p26', 'Cheryl', 'Moore', 'plane_5'),
('p27', 'Michael', 'Rivera', 'plane_8'),
('p28', 'Luther', 'Matthews', 'plane_8'),
('p29', 'Moses', 'Parks', 'plane_13'),
('p3', 'Tanya', 'Nguyen', 'port_1'),
('p30', 'Ora', 'Steele', 'plane_13'),
('p31', 'Antonio', 'Flores', 'plane_13'),
('p32', 'Glenn', 'Ross', 'plane_13'),
('p33', 'Irma', 'Thomas', 'plane_20'),
('p34', 'Ann', 'Maldonado', 'plane_20'),
('p35', 'Jeffrey', 'Cruz', 'port_12'),
('p36', 'Sonya', 'Price', 'port_12'),
('p37', 'Tracy', 'Hale', 'port_12'),
('p38', 'Albert', 'Simmons', 'port_14'),
('p39', 'Karen', 'Terry', 'port_15'),
('p4', 'Kendra', 'Jacobs', 'port_1'),
('p40', 'Glen', 'Kelley', 'port_20'),
('p41', 'Brooke', 'Little', 'port_3'),
('p42', 'Daryl', 'Nguyen', 'port_4'),
('p43', 'Judy', 'Willis', 'port_14'),
('p44', 'Marco', 'Klein', 'port_15'),
('p45', 'Angelica', 'Hampton', 'port_16'),
('p5', 'Jeff', 'Burton', 'port_1'),
('p6', 'Randal', 'Parks', 'port_1'),
('p10', 'Lawrence', 'Morgan', 'port_3'),
('p7', 'Sonya', 'Owens', 'port_2'),
('p9', 'Marlene', 'Warner', 'port_3'),
('p46', 'Janice', 'White', 'plane_10');


CREATE TABLE airport (
    airportID CHAR(3) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    country CHAR(3) NOT NULL,
    locationID VARCHAR(50),
	FOREIGN KEY (locationID) REFERENCES location(locationID)
);

INSERT INTO airport (airportID, name, city, state, country, locationID) VALUES
('ATL', 'Atlanta Hartsfield_Jackson International', 'Atlanta', 'Georgia', 'USA', 'port_1'),
('DXB', 'Dubai International', 'Dubai', 'Al Garhoud', 'UAE', 'port_2'),
('HND', 'Tokyo International Haneda', 'Ota City', 'Tokyo', 'JPN', 'port_3'),
('LHR', 'London Heathrow', 'London', 'England', 'GBR', 'port_4'),
('IST', 'Istanbul International', 'Arnavutkoy', 'Istanbul', 'TUR', NULL),
('DFW', 'Dallas_Fort Worth International', 'Dallas', 'Texas', 'USA', 'port_6'),
('CAN', 'Guangzhou International', 'Guangzhou', 'Guangdong', 'CHN', 'port_7'),
('DEN', 'Denver International', 'Denver', 'Colorado', 'USA', NULL),
('LAX', 'Los Angeles International', 'Los Angeles', 'California', 'USA', NULL),
('ORD', 'O_Hare International', 'Chicago', 'Illinois', 'USA', 'port_10'),
('AMS', 'Amsterdam Schipol International', 'Amsterdam', 'Haalemmermeer', 'NLD', 'port_11'),
('CDG', 'Paris Charles de Gaulle', 'Roissy_en_France', 'Paris', 'FRA', 'port_12'),
('FRA', 'Frankfurt International', 'Frankfurt', 'Frankfurt_Rhine_Main', 'DEU', 'port_13'),
('MAD', 'Madrid Adolfo Suarez Madrid_Barajas', 'Madrid', 'Barajas', 'ESP', 'port_14'),
('BCN', 'Barcelona International', 'Barcelona', 'Catalonia', 'ESP', 'port_15'),
('FCO', 'Rome Fiumicino', 'Fiumicino', 'Lazio', 'ITA', 'port_16'),
('LGW', 'London Gatwick', 'London', 'England', 'GBR', 'port_17'),
('MUC', 'Munich International', 'Munich', 'Bavaria', 'DEU', 'port_18'),
('MDW', 'Chicago Midway International', 'Chicago', 'Illinois', 'USA', NULL),
('IAH', 'George Bush Intercontinental', 'Houston', 'Texas', 'USA', 'port_20'),
('HOU', 'William P_Hobby', 'Houston', 'Texas', 'USA', 'port_21'),
('NRT', 'Narita International', 'Narita', 'Chiba', 'JPN', 'port_22'),
('BER', 'Berlin Brandenburg Willy Brandt International', 'Berlin', 'Schonefeld', 'DEU', 'port_23'),
('ICN', 'Incheon International Airport', 'Seoul', 'Jung_gu', 'KOR', 'port_24'),
('PVG', 'Shanghai Pudong International Airport', 'Shanghai', 'Pudong', 'CHN', 'port_25');

CREATE TABLE leg (
    legID VARCHAR(50) PRIMARY KEY,
    distance INT NOT NULL,
    origin_airportID CHAR(3),
    dest_airportID CHAR(3),
	FOREIGN KEY (origin_airportID) REFERENCES airport(airportID),
	FOREIGN KEY (dest_airportID) REFERENCES airport(airportID)
);

INSERT INTO leg (legID, distance, origin_airportID, dest_airportID) VALUES
('leg_4', 600, 'ATL', 'ORD'),
('leg_2', 3900, 'ATL', 'AMS'),
('leg_1', 400, 'AMS', 'BER'),
('leg_31', 3700, 'ORD', 'CDG'),
('leg_14', 400, 'CDG', 'MUC'),
('leg_3', 3700, 'ATL', 'LHR'),
('leg_22', 600, 'LHR', 'BER'),
('leg_23', 500, 'LHR', 'MUC'),
('leg_29', 400, 'MUC', 'FCO'),
('leg_16', 800, 'FCO', 'MAD'),
('leg_25', 600, 'MAD', 'CDG'),
('leg_13', 200, 'CDG', 'LHR'),
('leg_5', 500, 'BCN', 'CDG'),
('leg_27', 300, 'MUC', 'BER'),
('leg_8', 600, 'BER', 'LGW'),
('leg_21', 600, 'LGW', 'BER'),
('leg_9', 300, 'BER', 'MUC'),
('leg_28', 400, 'MUC', 'CDG'),
('leg_11', 500, 'CDG', 'BCN'),
('leg_6', 300, 'BCN', 'MAD'),
('leg_26', 800, 'MAD', 'FCO'),
('leg_30', 200, 'MUC', 'FRA'),
('leg_17', 300, 'FRA', 'BER'),
('leg_7', 4700, 'BER', 'CAN'),
('leg_10', 1600, 'CAN', 'HND'),
('leg_18', 100, 'HND', 'NRT'),
('leg_24', 300, 'MAD', 'BCN'),
('leg_12', 600, 'CDG', 'FCO'),
('leg_15', 200, 'DFW', 'IAH'),
('leg_20', 100, 'IAH', 'HOU'),
('leg_19', 300, 'HOU', 'DFW'),
('leg_32', 6800, 'DFW', 'ICN'),
('leg_33', 4400, 'ICN', 'LHR'),
('leg_34', 5900, 'ICN', 'LAX'),
('leg_35', 3700, 'CDG', 'ORD'),
('leg_36', 100, 'NRT', 'HND'),
('leg_37', 500, 'PVG', 'ICN'),
('leg_38', 6500, 'LAX', 'PVG');


CREATE TABLE airplane (
    tail_num VARCHAR(10),
    airlineID VARCHAR(50) NOT NULL,
    seat_cap INT NOT NULL CHECK (seat_cap > 0),
    speed INT NOT NULL,
    locationID VARCHAR(50),
    PRIMARY KEY(tail_num, airlineID),
	FOREIGN KEY (airlineID) REFERENCES airline(airlineID),
	FOREIGN KEY (locationID) REFERENCES location(locationID)
);

INSERT INTO airplane (tail_num, airlineID, seat_cap, speed, locationID) VALUES
('n106js','Delta',4,800,'plane_1'),
('n110jn','Delta',5,800,'plane_3'),
('n127js','Delta',4,600,NULL),
('n330ss','United',4,800,NULL),
('n380sd','United',5,400,'plane_5'),
('n616lt','British Airways',7,600,'plane_6'),
('n517ly','British Airways',4,600,'plane_7'),
('n620la','Lufthansa',4,800,'plane_8'),
('n401fj','Lufthansa',4,300,NULL),
('n653fk','Lufthansa',6,600,'plane_10'),
('n118fm','Air_France',4,400,NULL),
('n815pw','Air_France',3,400,NULL),
('n161fk','KLM',4,600,'plane_13'),
('n337as','KLM',5,400,NULL),
('n256ap','KLM',4,300,NULL),
('n156sq','Ryanair',8,600,NULL),
('n451fi','Ryanair',5,600,NULL),
('n341eb','Ryanair',4,400,'plane_18'),
('n353kz','Ryanair',4,400,NULL),
('n305fv','Japan Airlines',6,400,'plane_20'),
('n443wu','Japan Airlines',4,800,NULL),
('n454gq','China Southern Airlines',3,400,NULL),
('n249yk','China Southern Airlines',4,400,NULL),
('n180co','Korean Air Lines',5,600,'plane_4'),
('n448cs','American',4,400,NULL),
('n225sb','American',8,800,NULL),
('n553qn','American',5,800,'plane_2');

CREATE TABLE pilot (
    personID VARCHAR(50) NOT NULL,
    taxID CHAR(11) NOT NULL UNIQUE,
    experience INT,
    flightID VARCHAR(50),
    PRIMARY KEY (personID, taxID),  
	FOREIGN KEY (personID) REFERENCES person(personID),
	FOREIGN KEY (flightID) REFERENCES flight(flightID)
);

INSERT INTO pilot (personID, taxID, experience, flightID) VALUES
('p1', '330-12-6907', 31, 'dl_10'),
('p2', '842-88-1257', 9, 'dl_10'),
('p11', '369-22-9505', 22, 'km_16'),
('p13', '513-40-4168', 24, 'km_16'),
('p14', '454-71-7847', 13, 'km_16'),
('p15', '153-47-8101', 30, 'ja_35'),
('p16', '598-47-5172', 28, 'ja_35'),
('p12', '680-92-5329', 24, 'ry_34'),
('p17', '865-71-6800', 36, 'dl_42'),
('p18', '250-86-2784', 23, 'lf_67'),
('p19', '386-39-7881', 2, NULL),
('p8', '701-38-2179', 12, 'ry_34'),
('p20', '522-44-3098', 28, NULL),
('p3', '750-24-7616', 11, 'un_38'),
('p4', '776-21-8098', 24, 'un_38'),
('p5', '933-93-2165', 27, 'ba_61'),
('p6', '707-84-4555', 38, 'ba_61'),
('p10', '769-60-1266', 15, 'lf_20'),
('p7', '450-25-5617', 13, 'lf_20'),
('p9', '936-44-6941', 13, 'lf_20');


CREATE TABLE passenger (
    personID VARCHAR(50) PRIMARY KEY,
    funds INT,
    miles INT,
	FOREIGN KEY (personID) REFERENCES person(personID)
);

INSERT INTO passenger (personID, funds, miles) VALUES
('p21', 700, 771),
('p22', 200, 374),
('p23', 400, 414),
('p24', 500, 292),
('p25', 300, 390),
('p26', 600, 302),
('p27', 400, 470),
('p28', 400, 208),
('p29', 700, 292),
('p30', 500, 686),
('p31', 400, 547),
('p32', 500, 257),
('p33', 600, 564),
('p34', 200, 211),
('p35', 500, 233),
('p36', 400, 293),
('p37', 700, 552),
('p38', 700, 812),
('p39', 400, 541),
('p40', 700, 441),
('p41', 300, 875),
('p42', 500, 691),
('p43', 300, 572),
('p44', 500, 572),
('p45', 500, 663),
('p46', 5000, 690);


CREATE TABLE vacation (
	personID VARCHAR(50) NOT NULL,
    destination CHAR(3) NOT NULL,
    sequence INT NOT NULL,
    PRIMARY KEY (personID, sequence,destination),
	FOREIGN KEY (personID) REFERENCES passenger(personID)
);

INSERT INTO vacation (personID, destination, sequence) VALUES
('p21', 'AMS', 1),
('p22', 'AMS', 1),
('p23', 'BER', 1),
('p24', 'MUC', 1),
('p24', 'CDG', 2),
('p25', 'MUC', 1),
('p26', 'MUC', 1),
('p27', 'BER', 1),
('p28', 'LGW', 1),
('p29', 'FCO', 1),
('p29', 'LHR', 2),
('p30', 'FCO', 1),
('p30', 'MAD', 2),
('p31', 'FCO', 1),
('p32', 'FCO', 1),
('p33', 'CAN', 1),
('p34', 'HND', 1),
('p35', 'LGW', 1),
('p36', 'FCO', 1),
('p37', 'FCO', 1),
('p37', 'LGW', 2),
('p37', 'CDG', 3),
('p38', 'MUC', 1),
('p39', 'MUC', 1),
('p40', 'HND', 1),
-- ('p41', NULL, 1),
-- ('p42', NULL, 1),
-- ('p43', NULL, 1),
-- ('p44', NULL, 1),
-- ('p45', NULL, 1),
('p46', 'LGW', 1);


CREATE TABLE license (
    License_types VARCHAR(50),
    taxID CHAR(11) NOT NULL,
    primary key(License_types, taxID), 
	FOREIGN KEY (taxID) REFERENCES pilot(taxID)
);

INSERT INTO license (taxID, License_types) VALUES
('330-12-6907', 'airbus'),
('842-88-1257', 'airbus, boeing'),
('369-22-9505', 'airbus, boeing'),
('513-40-4168', 'airbus'),
('454-71-7847', 'airbus'),
('153-47-8101', 'airbus, boeing, general'),
('598-47-5172', 'airbus'),
('680-92-5329', 'boeing'),
('865-71-6800', 'airbus, boeing'),
('250-86-2784', 'airbus'),
('386-39-7881', 'airbus'),
('701-38-2179', 'boeing'),
('522-44-3098', 'airbus'),
('750-24-7616', 'airbus'),
('776-21-8098', 'airbus, boeing'),
('933-93-2165', 'airbus'),
('707-84-4555', 'airbus, boeing'),
('769-60-1266', 'airbus'),
('450-25-5617', 'airbus'),
('936-44-6941', 'airbus, boeing, general');

CREATE TABLE airbus (
    tail_num VARCHAR(10),
    airlineID VARCHAR(50),
    neo BOOLEAN,
    PRIMARY KEY (tail_num, airlineID),
	FOREIGN KEY (tail_num, airlineID) REFERENCES airplane(tail_num, airlineID)
);

INSERT INTO airbus (tail_num, airlineID, neo) VALUES
('n106js', 'Delta', FALSE),
('n110jn', 'Delta', FALSE),
('n127js', 'Delta', TRUE),
('n330ss', 'United', FALSE),
('n380sd', 'United', FALSE),
('n616lt', 'British Airways', FALSE),
('n517ly', 'British Airways', FALSE),
('n620la', 'Lufthansa', TRUE),
('n653fk', 'Lufthansa', FALSE),
('n815pw', 'Air_France', FALSE),
('n161fk', 'KLM', TRUE),
('n337as', 'KLM', FALSE),
('n156sq', 'Ryanair', FALSE),
('n451fi', 'Ryanair', TRUE),
('n305fv', 'Japan Airlines', FALSE),
('n443wu', 'Japan Airlines', TRUE),
('n180co', 'Korean Air Lines', FALSE),
('n225sb', 'American', FALSE),
('n553qn', 'American', FALSE);


CREATE TABLE boeing (
    tail_num VARCHAR(10),
    airlineID VARCHAR(50),
    model VARCHAR(30),
    maintenanced BOOLEAN,
    PRIMARY KEY (tail_num, airlineID),
	FOREIGN KEY (tail_num, airlineID) REFERENCES airplane(tail_num, airlineID)
);

INSERT INTO boeing (tail_num, airlineID, model, maintenanced) VALUES
('n118fm', 'Air_France', '777', FALSE),
('n256ap', 'KLM', '737', FALSE),
('n341eb', 'Ryanair', '737', TRUE),
('n353kz', 'Ryanair', '737', TRUE),
('n249yk', 'China Southern Airlines', '787', FALSE),
('n448cs', 'American', '787', TRUE);


CREATE TABLE Supports (
    flightID VARCHAR(50) NOT NULL,
    tail_num VARCHAR(10),
    airlineID VARCHAR(50),
    progress INT,
    airplane_status VARCHAR(9),
    next_time TIME,
    PRIMARY KEY (flightID),
    FOREIGN KEY (flightID) REFERENCES flight(flightID),
    FOREIGN KEY (tail_num, airlineID) REFERENCES airplane(tail_num, airlineID)
);

INSERT INTO Supports (flightID, tail_num, airlineID, progress, airplane_status, next_time) VALUES
('dl_10', 'n106js', 'Delta', 1, 'in_flight', '08:00:00'),
('un_38', 'n380sd', 'United', 2, 'in_flight', '14:30:00'),
('ba_61', 'n616lt', 'British Airways', 0, 'on_ground', '09:30:00'),
('lf_20', 'n620la', 'Lufthansa', 3, 'in_flight', '11:00:00'),
('km_16', 'n161fk', 'KLM', 6, 'in_flight', '14:00:00'),
('ba_51', 'n517ly', 'British Airways', 0, 'on_ground', '11:30:00'),
('ja_35', 'n305fv', 'Japan Airlines', 1, 'in_flight', '09:30:00'),
('ry_34', 'n341eb', 'Ryanair', 0, 'on_ground', '15:00:00'),
('aa_12', 'n553qn', 'American', 1, 'on_ground', '12:15:00'),
('dl_42', 'n110jn', 'Delta', 0, 'on_ground', '13:45:00'),
('ke_64', 'n180co', 'Korean Air Lines', 0, 'on_ground', '16:00:00'),
('lf_67', 'n653fk', 'Lufthansa', 6, 'on_ground', '21:23:00');

CREATE TABLE Contains (
    routeID VARCHAR(50) NOT NULL,
    legID VARCHAR(50) NOT NULL,
    sequence INT,
    PRIMARY KEY (routeID, sequence),
    CONSTRAINT fk_contains_route
	FOREIGN KEY (routeID) REFERENCES route(routeID),
    CONSTRAINT fk_contains_leg
	FOREIGN KEY (legID) REFERENCES leg(legID)
);

INSERT INTO Contains (routeID, legID, sequence) VALUES
('americas_hub_exchange', 'leg_4', 1),
('americas_one', 'leg_2', 1),
('americas_one', 'leg_1', 2),
('americas_three', 'leg_31', 1),
('americas_three', 'leg_14', 2),
('americas_two', 'leg_3', 1),
('americas_two', 'leg_22', 2),
('big_europe_loop', 'leg_23', 1),
('big_europe_loop', 'leg_29', 2),
('big_europe_loop', 'leg_16', 3),
('big_europe_loop', 'leg_25', 4),
('big_europe_loop', 'leg_13', 5),
('euro_north', 'leg_16', 1),
('euro_north', 'leg_24', 2),
('euro_north', 'leg_5', 3),
('euro_north', 'leg_14', 4),
('euro_north', 'leg_27', 5),
('euro_north', 'leg_8', 6),
('euro_south', 'leg_21', 1),
('euro_south', 'leg_9', 2),
('euro_south', 'leg_28', 3),
('euro_south', 'leg_11', 4),
('euro_south', 'leg_6', 5),
('euro_south', 'leg_26', 6),
('germany_local', 'leg_9', 1),
('germany_local', 'leg_30', 2),
('germany_local', 'leg_17', 3),
('pacific_rim_tour', 'leg_7', 1),
('pacific_rim_tour', 'leg_10', 2),
('pacific_rim_tour', 'leg_18', 3),
('south_euro_loop', 'leg_16', 1),
('south_euro_loop', 'leg_24', 2),
('south_euro_loop', 'leg_5', 3),
('south_euro_loop', 'leg_12', 4),
('texas_local', 'leg_15', 1),
('texas_local', 'leg_20', 2),
('texas_local', 'leg_19', 3),
('korea_direct', 'leg_32', 1);



