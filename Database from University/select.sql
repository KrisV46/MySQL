SELECT sportgroups.location, sportgroups.hours, sportgroups.dayOfWeek, sports.name
FROM sportgroups INNER JOIN sports ON sportgroups.sports_id = sports.id;

SELECT coaches.name, sportgroups.location, sportgroups.dayOfWeek, sportgroups.hours
FROM sportgroups INNER JOIN coaches ON sportgroups.coaches_id = coaches.id; 

SELECT coaches.name, coaches.egn, sports.name 
FROM coaches JOIN sports ON coaches.id IN (
    SELECT coaches_id FROM sportgroups WHERE sportgroups.sports_id = sports.id
)
WHERE coaches.id = 1;

SELECT sportgroups.location, sportgroups.dayOfWeek, sportgroups.sports_id, coaches.name
FROM sportgroups LEFT OUTER JOIN coaches ON sportgroups.coaches_id = coaches.id;

SELECT sportgroups.location, sportgroups.dayOfWeek, sportgroups.sports_id, coaches.name
FROM sportgroups RIGHT OUTER JOIN coaches ON sportgroups.coaches_id = coaches.id;

SELECT students.name, students.class, sportgroups.id
FROM students 
JOIN student_sportgroup ON students.id = student_sportgroup.students_id
JOIN sportgroups ON sportgroups.id = student_sportgroup.sportgroups_id
WHERE sportgroups.coaches_id = 2
AND sportgroups.dayOfWeek = 'понеделник' 
AND sportgroups.hours = '15:30:00';



