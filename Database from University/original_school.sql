DROP DATABASE school;
CREATE DATABASE school;
USE school;
CREATE TABLE students(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    egn VARCHAR(10) NOT NULL,
    address VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    class VARCHAR(5) NOT NULL
);
CREATE TABLE sports(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
CREATE TABLE coaches(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    egn VARCHAR(10) NOT NULL
);

CREATE TABLE sportgroups(
	id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(100) NOT NULL,
    dayOfWeek ENUM(
		'понеделник', 'вторник', 'сряда', 'четвъртък', 'петък'
	) NOT NULL,
    UNIQUE KEY(location, dayOfWeek),
    sports_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (sports_id) REFERENCES sports(id),
    coaches_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY(coaches_id) REFERENCES coaches(id)
);

CREATE TABLE student_sportgroup(
	students_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (students_id) REFERENCES students(id),
    sportgroups_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (sportgroups_id) REFERENCES sportgroups(id),
    PRIMARY KEY (students_id, sportgroups_id)
);

ALTER TABLE sportgroups ADD hours TIME NOT NULL;

INSERT INTO students(`name`, egn, address, phone, class) VALUES
	('Ивайло Петров', '1234567892', 'София', '0888844888', '10А'),
    ('Иванка Иванова', '0987654321', 'София', '0888888288', '10А'),
    ('Иван Петков', '1234567893', 'София', '0888888828', '10А'),
    ('Симеон Симеонов', '1234567894', 'София', '0888188888', '10А'),
    ('Йоан Стефанов', '381222222', 'Перник', '0877777777', '12Г');
    
INSERT INTO coaches(`name`, egn) VALUES
	('Павка Павков', '0392122222'),
    ('Стефани Стефанова', '929292929');

INSERT INTO sports(`name`) VALUES
	('yoga'), ('tennis');
    
INSERT INTO sportgroups(location, dayOfWeek, hours, sports_id, coaches_id) VALUES
	('ТУЕС', 'понеделник', '15:30:00', 1, 2),
    ('НПГГС', 'сряда', '10:30:00', 2, 1);
    
INSERT INTO student_sportgroup(students_id, sportgroups_id) VALUES
	(1, 2),
    (3, 1),
    (3, 2),
    (4, 1),
    (5, 1),
    (2, 1);
