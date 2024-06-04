USE school1;

CREATE TABLE taxesPayment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    group_id INT NOT NULL,
    paymentAmount DOUBLE NOT NULL,
    month INT,
    year YEAR,
    dateOfPayment DATETIME NOT NULL,
    CONSTRAINT FOREIGN KEY (student_id) REFERENCES students(id),
    CONSTRAINT FOREIGN KEY (group_id) REFERENCES sportgroups(id)
);

INSERT INTO taxesPayment VALUES
    (NULL, 1, 1, 200, 2, 2023, now()),
	(NULL, 2, 1, 200, 5, 2023, now()),
	(NULL, 2, 1, 200, 8, 2023, now()),
	(NULL, 1, 1, 200, 7, 2023, now()),
	(NULL, 1, 1, 250, 2, 2023, now()),
	(NULL, 2, 1, 210, 4, 2023, now());
        
SELECT COUNT(coaches_id) as CountOFSportGroupsWithCoaches
FROM sportgroups;

SELECT SUM(paymentAmount) as SumOfStudentPayment
FROM taxesPayment
WHERE student_id = 1;

SELECT MIN(paymentAmount) as MINfStudentPayment
FROM taxesPayment
WHERE student_id = 1;

SELECT AVG(paymentAmount) as AvgOfAllPayment
FROM taxesPayment
WHERE group_id = 1;

SELECT group_id as GroupID, AVG(paymentAmount) as
AvgOfAllPaymentPerGroup
FROM taxespayment
GROUP BY group_id;

SELECT students.id, students.name ,
SUM(paymentAmount) as SumOfAllPaymnetPerGroup, month 
FROM taxesPayment  JOIN students
ON student_id = students.id
GROUP BY month, student_id
HAVING SumOfAllPaymnetPerGroup > 200;
