-- creates a database named hr

CREATE DATABASE hr;

-- selects the database named "hr", this allows us to work within the "hr" database

USE hr;

/* creates table named "person"
creates an 8 integer column named "person_id" that requires a value that auto increments
creates a 25 character string column named "first_name" that requires a value
creates a 25 character string column named "last_name" that requires a value
creates a single character string column named "gender" that does not require a value
creates an 8 integer column named "age" that does not require a value
creates a 25 character column named "profession" that does not require a value
sets the primary key (unique identifier for each record) to be the "person_id" column
sets the auto_increment value to 1 */

CREATE TABLE person (
person_id INT(8) NOT NULL auto_increment,
first_name VARCHAR(25) NOT NULL,
last_name VARCHAR(25) NOT NULL,
gender VARCHAR(1) default NULL,
age INT(8) default NULL,
profession VARCHAR(25) default NULL,
PRIMARY KEY (person_id)
) AUTO_INCREMENT = 1;

/* creates table named "department"
creates an 8 integer column named "dept_id" that requires a value that auto increments
creates a 25 character string column named "dept_name" that requires a value
creates a 25 character string column named "building" that requires a value
sets the primary key (unique identifier for each record) to be the "dept_id" column
sets the auto_increment value to 1 */

CREATE TABLE department (
dept_id INT(8) NOT NULL auto_increment,
dept_name VARCHAR(25) NOT NULL,
building VARCHAR(25) NOT NULL,
PRIMARY KEY (dept_id)
) AUTO_INCREMENT = 1;

/* creates table named "person_department"
creates an 8 integer column named "person_id" that requires a value
creates an 8 integer column named "dept_id" that requires a value
sets the primary key (unique identifier for each record) to be the "person_id" and "dept_id" columns */

CREATE TABLE person_department (
person_id INT(8) NOT NULL,
dept_id INT(8) NOT NULL,
PRIMARY KEY (person_id,dept_id)
);


