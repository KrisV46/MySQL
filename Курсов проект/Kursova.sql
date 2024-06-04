DROP DATABASE IF EXISTS pharmacy;
CREATE DATABASE pharmacy;
USE pharmacy;
CREATE TABLE Products(
	product_id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(255),
    indication TEXT,
    dosage VARCHAR(100),
    usage_directions TEXT,
    price DECIMAL(10, 2)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    address TEXT,
    phone VARCHAR(20)
);

CREATE TABLE Purchases (
	purchase_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    purchase_date DATE,
    price DECIMAl(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Pharmacists (
	pharmacist_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15)
);

CREATE TABLE Prescriptions (
	prescription_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    pharmacist_id INT,
    prescription_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (pharmacist_id) REFERENCES Pharmacists(pharmacist_id)
    );
CREATE TABLE Price_Change_Log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    old_price DECIMAL(10, 2),
    new_price DECIMAL(10, 2),
    operation VARCHAR(100),
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO Products (product_id, name, category, indication, dosage, usage_directions, price)
VALUES 
(1, 'Aspirin', 'Аналгезик', 'Главоболие, болки в мускулите', '500mg', 'Вземайте 1 таблетка всеки 4 часа', 5.99),
(2, 'Paracetamol', 'Аналгезик', 'Главоболие, болки', '500mg', 'Вземайте 1 таблетка при нужда', 3.49),
(3, 'Amoxicillin', 'Антибиотик', 'Инфекции', '500mg', 'Вземайте 1 таблетка 3 пъти на ден', 8.75),
(4, 'Ibuprofen', 'Аналгезик', 'Болка, възпаление', '400mg', 'Вземайте 1 таблетка при нужда', 7.25),
(5, 'Loratadine', 'Антихистамин', 'Алергии', '10mg', 'Вземайте 1 таблетка дневно', 12.99);

INSERT INTO Customers (customer_id, name, email, address, phone)
VALUES 
(1, 'Иван Иванов', 'ivan@example.com', 'ул. Странджа 10, София', '0888123456'),
(2, 'Мария Петрова', 'maria@example.com', 'ул. Цариградско шосе 20, Пловдив', '0899234567'),
(3, 'Светла Георгиева', 'svetla@example.com','ул. Христо Ботев, Враца', '0888456789'),
(4, 'Иван Петров', 'ivan@example.com','ул. Нишава 131, София', '0899123456');

INSERT INTO Purchases (purchase_id, customer_id, product_id, purchase_date, price)
VALUES 
(1, 1, 1, '2024-04-17', 11.98),
(2, 1, 2, '2024-04-18', 3.49),
(3, 2, 3, '2024-04-16', 26.25),
(4, 3, 4, '2024-04-15', 21.25),
(5, 3, 5, '2024-04-16', 25.98),
(6, 4, 1, '2024-04-17', 7.99);

INSERT INTO Pharmacists (pharmacist_id, name, email, phone)
VALUES 
(1, 'Петър Иванов', 'peter@example.com', '0898123456'),
(2, 'Мария Георгиева', 'maria@example.com', '0888234567'),
(3, 'Светла Георгиева', 'svetla@example.com', '0888456789'),
(4, 'Иван Петров', 'ivan@example.com', '0899123456');


INSERT INTO Prescriptions (prescription_id, customer_id, product_id, pharmacist_id, prescription_date)
VALUES 
(1, 1, 1, 1, '2024-04-17'),
(2, 1, 2, 2, '2024-04-18'),
(3, 2, 3, 1, '2024-04-16'),
(4, 3, 4, 3, '2024-04-14'),
(5, 3, 5, 3, '2024-04-15'),
(6, 4, 1, 4, '2024-04-16');

    