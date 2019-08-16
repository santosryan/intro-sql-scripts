/* Alters the table named "customer" by adding a new column:
creates a single character string column named "gender" that does not require a value */

ALTER TABLE flight_reservation.customer
ADD COLUMN gender varchar(1) default NULL;

/* Alters the table named "customer" by updating the first 5 records with a value in the "gender" column:
Sets the gender to "M" for the first, third, and fifth record in the "customer" table
Sets the gender to "F" for the second, and fourth record in the "customer" table */

UPDATE flight_reservation.customer
SET gender = "M" 
WHERE customer_id = 1
OR customer_id = 3
OR customer_id = 5;

UPDATE flight_reservation.customer
SET gender = "F" 
WHERE customer_id = 2
OR customer_id = 4;

/* Alters the table named "customer" by updating the last 5 records with a value in the "gender" column:
Sets the gender to "U" for the last five records in the "customer" table. */

UPDATE flight_reservation.customer
SET gender = "U" 
WHERE customer_id > 5;

/* Inserts five new records into the table named "customer":
Creates an eleventh record for Ryan Santos, M,
Creates a twelfth record for Mario Mario, M
Creates a thirteenth record for Luigi Mario, M
Creates a fourteenth record for Peach Toadstool, F
Creates a fifteenth record for King Koopa, M.*/

INSERT INTO flight_reservation.customer (customer_id, first_name, last_name, gender)
VALUES (11, "Ryan", "Santos", "M"),
(12, "Mario", "Mario", "M"),
(13, "Luigi", "Mario", "M"),
(14, "Peach", "Toadstool", "F"),
(15, "King", "Koopa", "M");

/* Inserts two new records into the table named "flight":
Creates a sixth record for a fight from Providence to Tampa Bay, departing at 2018-02-02 05:30:00, arriving at 2018-02-02 08:30:00, and the flight is on time,
Creates a seventh record for a fight from New Bedford to Martha's Vineyard, departing at 2018-02-02 10:30:00, arriving at 2018-02-02 11:00:00, and the flight is on time */

INSERT INTO flight_reservation.flight (flight_id, from_city, to_city, departure_date_time,
 arrival_date_time, status_id)
VALUES (6, "Providence", "Tampa Bay", "2018-02-02 05:30:00", "2018-02-02 08:30:00", 1),
(7, "New Bedford", "Martha's Vineyard", "2018-02-02 10:30:00", "2018-02-02 11:00:00", 1); 

/* Inserts four new records into the table named "flight_reservation":
Creates a sixth record for a reservation for Ryan Santos on the flight from Providence to Tampa Bay
Creates a seventh record for a reservation for Mario Mario on the flight from Providence to Tampa Bay 
Creates an eighth record for a reservation for Luigi Mario on the flight from New Bedford to Martha's Vineyard
Creates a ninth record for a reservation for Peach Toadstool on the flight from New Bedford to Martha's Vineyard */

INSERT INTO flight_reservation.flight_reservation (flight_id, customer_id)
VALUES (6, 11),
(6, 12),
(7, 13),
(7, 14);

/* Deletes a record from the "flight" table:
Deletes all records where there is a flight from Seattle to Las Vegas */

DELETE FROM flight_reservation.flight
WHERE from_city = "Seattle" AND to_city = "Las Vegas";