-- creates a database named accommodations

CREATE DATABASE accommodations;

/* creates table named "hotels"
creates an 8 integer column named "hotel_id" that requires a value that auto increments
creates a 25 character string column named "hotel_name" that requires a value
creates a 25 character string column named "address" that requires a value
creates an 8 integer column named "total_rooms" that does not require a value
sets the primary key (unique identifier for each record) to be the "hotel_id" column
sets the auto_increment value to 1 */

CREATE TABLE accommodations.hotels (
hotel_id INT(8) NOT NULL auto_increment,
hotel_name VARCHAR(25) NOT NULL,
address VARCHAR(25) NOT NULL,
total_rooms INT(8) default NULL,
PRIMARY KEY (hotel_id)
) AUTO_INCREMENT = 1;

-- Loads data from CSV file into hotels table 

LOAD DATA INFILE 'hotels.csv'
INTO TABLE accommodations.hotels     
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(hotel_name,address,total_rooms);

/* Creates temporary table named "temp_update_table"
Loads data from images.csv into the "temp_update_table" table
Copies data from "temp_update_table" table to "image" table */

CREATE TEMPORARY TABLE messaging.temp_update_table (image_name, image_location)

LOAD DATA INFILE 'images.csv' 
INTO TABLE messaging.temp_update_table 
FIELDS TERMINATED BY ';' 
(image_name, image_location); 

INSERT INTO messaging.image (image_name, image_location)
SELECT image_name, image_location FROM messaging.temp_update_table;

DROP TEMPORARY TABLE temp_update_table;

/* Creates temporary table named "temp_update_table"
Loads data from people.csv into the "temp_update_table" table
Copies data from "temp_update_table" table to "person" table */

CREATE TEMPORARY TABLE messaging.temp_update_table (first_name, last_name, gender)

LOAD DATA INFILE 'people.csv' 
INTO TABLE messaging.temp_update_table 
FIELDS TERMINATED BY ';' 
(first_name, last_name, gender); 

INSERT INTO messaging.person (first_name, last_name, gender)
SELECT first_name, last_name, gender FROM messaging.temp_update_table;

DROP TEMPORARY TABLE temp_update_table;

-- Deletes records from the "person" table where the first name is "Captain"

DELETE FROM flight_reservation.flight
WHERE first_name = "Captain";

/* Takes first_name, last_name, and gender from the "person" table
where gender has a NULL value, and outputs to a csv file named "gender_null.csv" */

SELECT first_name, last_name, gender
FROM messaging.person
WHERE gender IS NULL
INTO OUTFILE 'gender_null.csv' 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' ESCAPED BY '\' 
LINES TERMINATED BY '\n';

/* Takes all data from the "person" table and outputs to a csv file named "person_UPDATED.csv" */

SELECT *
FROM messaging.person
WHERE gender IS NULL
INTO OUTFILE 'person_UPDATED.csv' 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' ESCAPED BY '\' 
LINES TERMINATED BY '\n';

/* Takes all data from the "image" table and outputs to a csv file named "images_UPDATED.csv" */

SELECT *
FROM messaging.image
WHERE gender IS NULL
INTO OUTFILE 'images_UPDATED.csv' 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' ESCAPED BY '\' 
LINES TERMINATED BY '\n';