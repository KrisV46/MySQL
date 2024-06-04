DROP DATABASE IF EXISTS transaction_test;
CREATE DATABASE IF NOT EXISTS transaction_test;
USE transaction_test;
DROP TABLE if exists customer_accounts;
DROP TABLE if exists customers;

CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(255)
); 

CREATE TABLE IF NOT EXISTS customer_accounts(
    id INT AUTO_INCREMENT PRIMARY KEY,
    amount DOUBLE NOT NULL,
    currency VARCHAR(10),
    customer_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO transaction_test. customers(name, address) VALUES
    ('Ivan Petrov Yordanov', 'Sofia, Krasno selo, 1000'),
    ('Stoyan Pavlov Pavlov', 'Sofia, Lylin 7, bl.34'),
    ('Iliya Mladenov Mladenov', 'Sofia, Nadejda, bl.33');


INSERT INTO transaction_test. customer_accounts(amount, currency, customer_id) VALUES
    (450, 'BGN', 1),
    (14500000, 'EUR', 1),
    (10050, 'EUR', 2),
    (14450, 'BGN', 2);
    
    BEGIN;
    
    UPDATE customer_accounts
    SET amount = amount - 300
    WHERE ID =1;
    
    UPDATE customer_accounts
    SET amount = amount + 300
    WHERE ID = 2;
    
    COMMIT;
    
DELIMITER |
CREATE PROCEDURE update_money(IN var DOUBLE, IN id1 INT, IN id2 INT)
BEGIN
    UPDATE customer_accounts
    SET amount = amount + var
    WHERE id = id1;
    
    UPDATE customer_accounts
    SET amount = amount - var
    WHERE id = id2;
END |
DELIMITER ;

CALL update_money(23.9, 2, 1);

    

    