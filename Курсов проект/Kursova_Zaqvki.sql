use pharmacy;
SELECT * FROM Products WHERE price > 5.00;

SELECT category, AVG(price) AS avg_price FROM Products GROUP BY category;

SELECT Customers.name, Purchases.purchase_date, Products.name AS product_name
FROM Customers
INNER JOIN Purchases ON Customers.customer_id = Purchases.customer_id
INNER JOIN Products ON Purchases.product_id = Products.product_id;

SELECT Customers.name, Purchases.purchase_date, Products.name AS product_name
FROM Customers
LEFT JOIN Purchases ON Customers.customer_id = Purchases.customer_id
LEFT JOIN Products ON Purchases.product_id = Products.product_id
WHERE Products.category = 'Аналгезик';

SELECT name, price
FROM Products
WHERE price IN (SELECT MAX(price) FROM Products);

SELECT Customers.name, COUNT(Purchases.purchase_id) AS total_purchases
FROM Customers
LEFT JOIN Purchases ON Customers.customer_id = Purchases.customer_id
GROUP BY Customers.name;



DELIMITER |

CREATE TRIGGER update_product_price_trigger
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN
    IF NEW.price <> OLD.price THEN
        INSERT INTO Price_Change_Log (product_id, old_price, new_price, change_date, operation)
        VALUES (NEW.product_id, OLD.price, NEW.price, NOW(), 'Update');
    END IF;
END;
|
DELIMITER ;


UPDATE Products SET price = 25.00 WHERE product_id = 3;



	

DELIMITER $$

CREATE PROCEDURE ShowProductsWithPrices()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE productId INT;
    DECLARE productName VARCHAR(100);
    DECLARE productPrice DECIMAL(10, 2);
    
    DECLARE cur CURSOR FOR SELECT product_id, name, price FROM Products;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    CREATE TEMPORARY TABLE ProductPrices (
        productName VARCHAR(100),
        productPrice DECIMAL(10, 2)
    );

    OPEN cur;
    
    productLoop: LOOP
        FETCH cur INTO productId, productName, productPrice;
        IF done = 1 THEN
            LEAVE productLoop;
        END IF;
        
        INSERT INTO ProductPrices (productName, productPrice) VALUES (productName, productPrice);
    END LOOP;
    
    CLOSE cur;

    SELECT * FROM ProductPrices;
    
END$$

DELIMITER ;

CALL ShowProductsWithPrices();



