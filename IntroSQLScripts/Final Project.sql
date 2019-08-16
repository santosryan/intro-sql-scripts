/* Inserts a new record into the table named "person":
Creates a seventh record for Ryan Santos */

INSERT INTO messaging.person(person_id, first_name, last_name)
VALUES (7, "Ryan", "Santo
s");

/* Alters the table named "person" by adding a new column:
creates a single character string column named "gender" that does not require a value */

ALTER TABLE messaging.person
ADD COLUMN gender varchar(1) default NULL;

/* Alters the table named "person" by updating the seventh record with a value in the "gender" column:
Sets the gender to "M" for the seventh record in the "person" table */

UPDATE messaging.person
SET gender = "M" WHERE person_id = 7;

/* Deletes records from the "person" table:
Deletes all records where there is a person with the first name "Diana" and last name "Taurasi" */

DELETE FROM messaging.person
WHERE first_name = "Diana" AND last_name = "Taurasi";

/* Alters the table named "contact_list" by adding a new column:
creates a ten character string column named "favorite" that does not require a value */

ALTER TABLE messaging.contact_list
ADD COLUMN favorite varchar(10) default NULL;

/* Updates the table named "contact_list" by setting Michael Phelps as the "favorite" for all the records with Michael Phelps as their contact id (contact_id = 1):
Sets the favorite to "y" for for all the records with Michael Phelps as their contact id (contact_id = 1) */

UPDATE messaging.contact_list
SET favorite = "y"
WHERE contact_id = 1;

/* Updates the table named "contact_list" by setting the "favorite" for all the records without Michael Phelps as their contact id (contact_id = 1):
Sets the favorite to "n" for all the records without Michael Phelps as their contact id */

UPDATE messaging.contact_list
SET favorite = "n"
WHERE contact_id <> 1;

/* Inserts three new records into the table named "contact_list":
Creates a fifteenth record for person id 1, sets Ryan Santos as their contact id, and sets Ryan Santos as their favorite
Creates a sixteenth record for person id 3, sets Ryan Santos as their contact id, and doesn't set Ryan Santos as their favorite
Creates a seventeenth record for person id 5, sets Ryan Santos as their contact id, and doesn't set Ryan Santos as their favorite */

INSERT INTO messaging.contact_list (connection_id, person_id, contact_id, favorite)
VALUES (15, 1, 7, "y"),
(16, 3, 7, "n"),
(17, 5, 7, "n");

/* creates table named "image"
creates an 8 integer column named "image_id" that requires a value that auto increments
creates a 50 character string column named "image_name" that requires a value
creates a 250 character string column named "image_location" that requires a value
sets the primary key (unique identifier for each record) to be the "image_id" column
sets the auto_increment value to 1 */

CREATE TABLE image (
image_id INT(8) NOT NULL auto_increment,
image_name VARCHAR(50) NOT NULL,
image_location VARCHAR(250) NOT NULL,
PRIMARY KEY (image_id)
) AUTO_INCREMENT = 1;

/* creates table named "message_image"
creates an 8 integer column named "message_id" that requires a value
creates an 8 integer column named "image_id" that requires a value
sets the primary key (unique identifier for each record) to be the "message_id" and "image_id" columns */

CREATE TABLE message_image (
message_id INT(8) NOT NULL,
image_id INT(8) NOT NULL,
PRIMARY KEY (message_id,image_id)
);

/* Inserts five new records into the table named "image":
Creates a first record for image "selfie_1" with image location "Images"
Creates a second record for image "selfie_2" with image location "Images"
Creates a third record for image "selfie_3" with image location "Images"
Creates a fourth record for image "selfie_4" with image location "Images"
Creates a fifth record for image "selfie_5" with image location "Images" */

INSERT INTO messaging.image (image_id, image_name, image_location) VALUES (1, "selfie_1", "Images"), (2, "selfie_2", "Images"), (3, "selfie_3", "Images"), (4, "selfie_4", "Images"), (5, "selfie_5", "Images");

/* Inserts five new records into the table named "message_image":
Creates a first record for message id 1 with image id 1
Creates a second record for message id 1 with image id 2
Creates a third record for message id 2 with image id 3
Creates a fourth record for message id 3 with image id 4
Creates a fifth record for  message id 4 with image id 5 */

INSERT INTO messaging.message_image (message_id, image_id) VALUES (1, 1), (1, 2), (2, 3), (3, 4), (4, 5);

/* Displays all messages that Michael Phelps sent, and displays the following columns and their values:
Sender's first name
Sender's last name
Receiver's first name
Receiver's last name
Message ID
Message
Message Timestamp
*/

SELECT person.first_name AS senders_first_name, person.last_name AS senders_last_name, person2.first_name AS receivers_first_name, person2.last_name AS receivers_lastname, message.message_id, message.message, message.send_datetime AS message_timestamp FROM contact_list JOIN person ON contact_list.person_id = person.person_id JOIN message ON person.person_id = message.sender_id JOIN person AS person2 ON message.receiver_id = person2.person_id WHERE contact_list.person_id = 1 GROUP BY message.receiver_id;

/* Displays the number of messages sent for every person, and displays the following columns and their values:
Count of messages
Person ID
First name
Last name */

SELECT COUNT(message.sender_id) AS count_of_messages,
person.person_id, person.first_name, person.last_name
FROM message
JOIN person ON message.sender_id = person.person_id
WHERE person.person_id <= 7
GROUP BY message.sender_id;

/* Displays the messages sent that have an image attached, and displays the following columns and their values:
Message ID
Message
Message Timestamp
First Image Name
First Image Location */
SELECT message.message_id, message.message, message.send_datetime,
image.image_name, image.image_location
FROM message
INNER JOIN message_image ON message.message_id = message_image.message_id
INNER JOIN image ON message_image.image_id = image.image_id
WHERE 
