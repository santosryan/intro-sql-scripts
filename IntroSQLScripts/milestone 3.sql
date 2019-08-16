/* Displays all meetings that Tom Hanks must attend, and displays the following columns and their values:
Person�s first name
Person�s last name
Building name
Room number
Meeting start date and time
Meeting end date and time
*/

SELECT person.first_name, person.last_name, 
building.building_name, room.room_number,
meeting.meeting_s
tart, meeting.meeting_end
FROM person
JOIN person_meeting ON person.person_id = person_meeting.person_id
JOIN m
eeting ON person_meeting.meeting_id = meeting.meeting_id
JOIN room ON meeting.room_id = room.room_id
JOIN buildi
ng ON room.building_id = building.building_id
WHERE person.person_id = 1;

/* Joins tables together to display all meetings that the person associated with meeting ID 2 has to attend, and displays the following columns and their values:
Person�s first name
Person�s last name
Building name
Room number
Meeting start date and time
Meeting end date and time
*/

SELECT person.first_name, person.last_name, 
building.building_name, room.room_number,
meeting.meeting_s
tart, meeting.meeting_end
FROM person
JOIN person_meeting ON person.person_id = person_meeting.person_id
JOIN m
eeting ON person_meeting.meeting_id = meeting.meeting_id
JOIN room ON meeting.room_id = room.room_id
JOIN buildi
ng ON room.building_id = building.building_id
WHERE person_meeting.meeting_id = 2;

/* Joins tables together to display all the meetings in the Main Street building that people must attend, and displays the following columns and their values:
Person�s first name
Person�s last name
Building name
Room number
Meeting ID
Meeting start date and time
Meeting end date and time
*/

SELECT person.first_name, person.last_name,
building.building_name, room.room_number,
meeting.meeting_id, meeting.meeting_start, meeting.meeting_end
FROM person
JOIN person_meeting ON person.person_id = person_meeting.person_id
JOIN m
eeting ON person_meeting.meeting_id = meeting.meeting_id
JOIN room ON meeting.room_id = room.room_id
JOIN buildi
ng ON room.building_id = building.building_id
WHERE building.building_id = 2;

/* Joins tables together to display the number of attendees for every meeting, and displays the following columns and their values:
Count of meeting attendees
Meeting ID
Meeting start date and time
Meeting end date and time
*/

SELECT COUNT(person_meeting.person_id) AS meeting_attendee_count,
meeting.meeting_id, meeting.meeting_start, meeting.meeting_end
FROM person
JOIN person_meeting ON person.person_id = person_meeting.person_id
JOIN m
eeting ON person_meeting.meeting_id = meeting.meeting_id
WHERE person_meeting.meeting_id <= 6
GROUP BY person_meeting.meeting_id;

/* Joins tables together to display all of the people who have meetings only before Dec. 25, 2016 at Noon and displays the following columns and their values:
Person�s first name
Person�s last name
Meeting ID
Meeting start date and time
Meeting end date and time
*/

SELECT person.first_name, person.last_name,
meeting.meeting_id, meeting.meeting_s
tart, meeting.meeting_end
FROM person
INNER JOIN person_meeting ON person.person_id = person_meeting.person_id
INNER JOIN m
eeting ON person_meeting.meeting_id = meeting.meeting_id
WHERE meeting.meeting_start < '2016-12-25 12:00:00';