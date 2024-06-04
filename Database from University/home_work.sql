SELECT student1.name AS firstPlayer, student2.name AS secondPlayer, sp.name AS sportName
FROM students AS student1
JOIN students AS student2 ON student1.id > student2.id 
JOIN student_sportgroup AS ss1 ON student1.id = ss1.students_id
JOIN student_sportgroup AS ss2 ON student2.id = ss2.students_id
JOIN sportgroups AS sg1 ON ss1.sportgroups_id = sg1.id
JOIN sportgroups AS sg2 ON ss2.sportgroups_id = sg2.id
JOIN sports AS sp ON sg1.sports_id = sp.id AND sg2.sports_id = sp.id
ORDER BY sportName;
