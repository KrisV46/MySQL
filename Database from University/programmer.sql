DROP DATABASE pr;
CREATE DATABASE pr;
USE pr;
CREATE TABLE programmer(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    startDATE DATE, 
    teamLeader_id INT NULL default NULL,
    CONSTRAINT FOREIGN KEY (teamLeader_id) REFERENCES programmer(id)
);

INSERT INTO programmer (name, address, startDate, teamLeader_id) 
VALUES ('Ivan Petrov', 'Sofia', '2024-01-04', NULL);

INSERT INTO programmer (name, address, startDate, teamLeader_id) VALUES 
 ('Georgi Ivanov', 'Sofia', '2023-12-09', 1),
 ('Ana Hristova', 'Plovdiv', '2023-12-09', 1),
 ('Petq Petrova', 'Varna', '2023-07-02', 2),
 ('Pepi Petrov', 'Sofia', '2023-11-09', NULL);