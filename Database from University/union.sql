(SELECT name, egn FROM students)
UNION
(SELECT name, id FROM sports);

(SELECT sportgroups.location, sportgroups.hours, coaches.name
FROM sportgroups LEFT JOIN coaches
ON sportgroups.coaches_id = coaches.id)
UNION
(SELECT sportgroups.location, sportgroups.hours, coaches.name
FROM sportgroups RIGHT JOIN coaches
ON sportgroups.coaches_id = coaches.id
WHERE sportgroups.coaches_id = NULL);

SELECT coaches.name AS CoachName, sports.name AS Sport
FROM coaches JOIN sports
ON coaches.id IN(
SELECT coaches_id FROM sportgroups
WHERE sportgroups.sports_id = sports.id);

SELECT sportgroups.location AS Sofia, sports.name AS Sport, sportgroups.id AS Number
FROM sportgroups JOIN sports ON sportgroups.sports_id = sports.id
WHERE sportgroups.location = 'ТУЕС'; 

SELECT student1.name AS Student1, student2.name AS Student2, sports.name AS SportName


