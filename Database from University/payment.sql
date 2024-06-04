CREATE TABLE salaryPayments (
	id INT AUTO_INCREMENT PRIMARY KEY,
    coach_id INT NOT NULL,
    group_id INT NOT NULL,
    month INT,
    year YEAR,
    salaryAmount DOUBLE,
    dateOfPayment DATETIME NOT NULL,
    CONSTRAINT FOREIGN KEY (coach_id) REFERENCES coaches(id),
    UNIQUE KEY (coach_id, month, year)
);

