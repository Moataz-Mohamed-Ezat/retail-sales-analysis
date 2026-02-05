CREATE DATABASE sales_db;
USE sales_db;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    gender VARCHAR(10),
    city VARCHAR(100),
    join_date DATE
);


CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);


CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(150),
    category_id INT,
    price DECIMAL(10,2),
    cost DECIMAL(10,2),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Price_History (
    price_id INT PRIMARY KEY,
    product_id INT,
    old_price DECIMAL(10,2),
    new_price DECIMAL(10,2),
    change_date DATE,
    reason VARCHAR(100),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Discounts (
    discount_id INT PRIMARY KEY,
    product_id INT,
    discount_percentage DECIMAL(5,2),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Promotions (
    promotion_id INT PRIMARY KEY,
    promotion_type VARCHAR(100),
    promotion_percentage DECIMAL(5,2),
    start_date DATE,
    end_date DATE,
    budget DECIMAL(10,2)
);


CREATE TABLE Promotion_Products (
    promotion_id INT,
    product_id INT,
    PRIMARY KEY (promotion_id, product_id),
    FOREIGN KEY (promotion_id) REFERENCES Promotions(promotion_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Inventory_Transactions (
    transaction_id INT PRIMARY KEY,
    product_id INT,
    transaction_type VARCHAR(10),
    quantity INT,
    transaction_date DATE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
UPDATE Products SET product_name = 'Rice' WHERE product_id = 1;
UPDATE Products SET product_name = 'Chair' WHERE product_id = 2;
UPDATE Products SET product_name = 'Laptop' WHERE product_id = 3;
UPDATE Products SET product_name = 'Pasta' WHERE product_id = 4;
UPDATE Products SET product_name = 'Table' WHERE product_id = 5;
UPDATE Products SET product_name = 'T-Shirt' WHERE product_id = 6;
UPDATE Products SET product_name = 'Cooking Oil' WHERE product_id = 7;
UPDATE Products SET product_name = 'Jeans' WHERE product_id = 8;
UPDATE Products SET product_name = 'Sofa' WHERE product_id = 9;
UPDATE Products SET product_name = 'Lamp' WHERE product_id = 10;
UPDATE Products SET product_name = 'Headphones' WHERE product_id = 11;
UPDATE Products SET product_name = 'Curtain' WHERE product_id = 12;
UPDATE Products SET product_name = 'Smart TV' WHERE product_id = 13;
UPDATE Products SET product_name = 'Carpet' WHERE product_id = 14;
UPDATE Products SET product_name = 'Jacket' WHERE product_id = 15;
UPDATE Products SET product_name = 'Washing Machine' WHERE product_id = 16;
UPDATE Products SET product_name = 'Refrigerator' WHERE product_id = 17;
UPDATE Products SET product_name = 'Sugar' WHERE product_id = 18;
UPDATE Products SET product_name = 'Mobile Phone' WHERE product_id = 19;
UPDATE Products SET product_name = 'Shoes' WHERE product_id = 20;




--edit price and cost 
UPDATE Products SET price = 25, cost = 18 WHERE product_name = 'Rice';
UPDATE Products SET price = 15, cost = 10 WHERE product_name = 'Pasta';
UPDATE Products SET price = 80, cost = 65 WHERE product_name = 'Cooking Oil';
UPDATE Products SET price = 20, cost = 14 WHERE product_name = 'Sugar';


UPDATE Products SET price = 300, cost = 180 WHERE product_name = 'T-Shirt';
UPDATE Products SET price = 600, cost = 380 WHERE product_name = 'Jeans';
UPDATE Products SET price = 900, cost = 620 WHERE product_name = 'Jacket';
UPDATE Products SET price = 750, cost = 500 WHERE product_name = 'Shoes';


UPDATE Products SET price = 18000, cost = 14000 WHERE product_name = 'Laptop';
UPDATE Products SET price = 12000, cost = 9000 WHERE product_name = 'Smart TV';
UPDATE Products SET price = 10000, cost = 7800 WHERE product_name = 'Mobile Phone';
UPDATE Products SET price = 800, cost = 500 WHERE product_name = 'Headphones';


UPDATE Products SET price = 450, cost = 300 WHERE product_name = 'Chair';
UPDATE Products SET price = 1200, cost = 850 WHERE product_name = 'Table';
UPDATE Products SET price = 6000, cost = 4500 WHERE product_name = 'Sofa';
UPDATE Products SET price = 300, cost = 180 WHERE product_name = 'Lamp';
UPDATE Products SET price = 400, cost = 250 WHERE product_name = 'Curtain';
UPDATE Products SET price = 2500, cost = 1700 WHERE product_name = 'Carpet';
UPDATE Products SET price = 9000, cost = 7000 WHERE product_name = 'Washing Machine';
UPDATE Products SET price = 11000, cost = 8500 WHERE product_name = 'Refrigerator';

INSERT INTO Promotions
(promotion_id, promotion_type, promotion_percentage, start_date, end_date, budget)
VALUES
(1, 'Summer Sale', 20, '2024-06-01', '2024-06-15', 40000);

INSERT INTO Promotion_Products (promotion_id, product_id)
VALUES
(1, 3),   
(1, 6),   
(1, 1);  

INSERT INTO Discounts
(discount_id, product_id, discount_percentage, start_date, end_date)
VALUES
(1, 3, 15, '2024-06-01', '2024-06-10');


INSERT INTO Inventory_Transactions
(transaction_id, product_id, transaction_type, quantity, transaction_date)
VALUES
(1, 3, 'IN', 100, '2024-05-25');


INSERT INTO Inventory_Transactions
(transaction_id, product_id, transaction_type, quantity, transaction_date)
VALUES
(2, 3, 'OUT', 5, '2024-06-02'),
(3, 3, 'OUT', 3, '2024-06-03');

INSERT INTO Inventory_Transactions
(transaction_id, product_id, transaction_type, quantity, transaction_date)
VALUES
(4, 3, 'OUT', 20, '2024-06-01');

INSERT INTO Orders (order_id, customer_id, order_date, total_amount)
VALUES
(1001, 12, '2024-06-02', 0.0),
(1002, 25, '2024-06-05', 0.0),
(1003, 40, '2024-06-10', 0.0);



INSERT INTO Order_Details
(order_detail_id, order_id, product_id, quantity, unit_price)
VALUES
(3000, 1001, 3, 1, 14400),
(3001, 1002, 3, 2, 14400),
(2002, 1003, 1, 5, 20); 

UPDATE Orders
SET total_amount = (
    SELECT SUM(quantity * unit_price)
    FROM Order_Details
    WHERE Order_Details.order_id = Orders.order_id
)
WHERE order_id >= 1001;

INSERT INTO Price_History
(price_id, product_id, old_price, new_price, change_date, reason)
VALUES
(1, 3, 18000, 14400, '2024-06-01', 'Summer Promotion'),
(2, 6, 300,   240,   '2024-06-01', 'Summer Promotion'),
(3, 1, 25,    20,    '2024-06-01', 'Summer Promotion');

INSERT INTO Price_History
(price_id, product_id, old_price, new_price, change_date, reason)
VALUES
(4, 3, 14400, 18000, '2024-06-16', 'Promotion End'),
(5, 6, 240,   300,   '2024-06-16', 'Promotion End'),
(6, 1, 20,    25,    '2024-06-16', 'Promotion End');

UPDATE od
SET od.unit_price = p.price
FROM Order_Details od
JOIN Products p
    ON od.product_id = p.product_id;

UPDATE Orders
SET total_amount = (
    SELECT SUM(od.quantity * od.unit_price)
    FROM Order_Details od
    WHERE od.order_id = Orders.order_id
);

SELECT
    product_id,
    SUM(quantity) AS sold_qty
FROM Order_Details
GROUP BY product_id;





INSERT INTO Inventory_Transactions
(transaction_id, product_id, transaction_type, quantity, transaction_date)
SELECT
    ROW_NUMBER() OVER (ORDER BY product_id) 
    + (SELECT ISNULL(MAX(transaction_id), 0) FROM Inventory_Transactions),
    product_id,
    'IN',
    CAST(SUM(quantity) * 2.5 AS INT),
    '2024-05-15'
FROM Order_Details
GROUP BY product_id;

INSERT INTO Inventory_Transactions
(transaction_id, product_id, transaction_type, quantity, transaction_date)
SELECT
    ROW_NUMBER() OVER (ORDER BY o.order_date, od.product_id)
    + (SELECT ISNULL(MAX(transaction_id), 0) FROM Inventory_Transactions),
    od.product_id,
    'OUT',
    od.quantity,
    o.order_date
FROM Order_Details od
JOIN Orders o
    ON od.order_id = o.order_id;




UPDATE Customers
SET city =
    CASE ABS(CHECKSUM(NEWID())) % 8
        WHEN 0 THEN 'Beni Suef'
        WHEN 1 THEN 'Giza'
        WHEN 2 THEN 'Alexandria'
        WHEN 3 THEN 'Sohag'
        WHEN 4 THEN 'Asyut'
        ELSE 'Cairo'
    END;



ALTER TABLE Customers
ADD country VARCHAR(50);

UPDATE Customers
SET country = 'Egypt';

SELECT customer_id, city, country
FROM Customers;

SELECT * FROM Promotions;

--query--
--1--

SELECT 
    SUM(quantity * unit_price) AS total_sales
FROM Order_Details;

--2--
SELECT
    p.product_name,
    SUM(od.quantity * od.unit_price) AS sales,
    SUM(od.quantity * (od.unit_price - p.cost)) AS profit
FROM Order_Details od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY profit DESC;


--3--
SELECT
    od.order_id,
    od.product_id,
    CASE
        WHEN o.order_date BETWEEN '2024-06-01' AND '2024-06-15'
             AND od.product_id IN (1,3,6)
        THEN 'Promotion Sale'
        ELSE 'Regular Sale'
    END AS sale_type
FROM Order_Details od
JOIN Orders o ON od.order_id = o.order_id;

--4--
SELECT
    product_id,
    SUM(
        CASE 
            WHEN transaction_type = 'IN' THEN quantity
            ELSE -quantity
        END
    ) AS stock_balance,
    CASE
        WHEN SUM(
            CASE WHEN transaction_type = 'IN' THEN quantity ELSE -quantity END
        ) < 2000 THEN 'Low Stock'
        WHEN SUM(
            CASE WHEN transaction_type = 'IN' THEN quantity ELSE -quantity END
        ) BETWEEN 2000 AND 2300 THEN 'Normal Stock'
        ELSE 'Overstock'
    END AS stock_status
FROM Inventory_Transactions
GROUP BY product_id;

--5--
SELECT
    p.product_name,
    SUM(od.quantity * (od.unit_price - p.cost)) AS total_profit,
    CASE
        WHEN SUM(od.quantity * (od.unit_price - p.cost)) < 10000 THEN 'Low Profit'
        WHEN SUM(od.quantity * (od.unit_price - p.cost)) BETWEEN 10000 AND 50000 THEN 'Medium Profit'
        ELSE 'High Profit'
    END AS profit_category
FROM Order_Details od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_profit desc;

--6--
SELECT
    order_id,
    order_date,
    CASE
        WHEN MONTH(order_date) IN (6,7,8) THEN 'Summer'
        WHEN MONTH(order_date) IN (12,1,2) THEN 'Winter'
        ELSE 'Regular Season'
    END AS season
FROM Orders;

--7--
SELECT
    p.product_name,
    ph.old_price,
    ph.new_price,
    ph.change_date,
    ph.reason
FROM Price_History ph
JOIN Products p ON ph.product_id = p.product_id
ORDER BY ph.change_date;

--8--
SELECT 
    SUM(od.quantity * od.unit_price) AS promotion_sales
FROM Order_Details od
JOIN Orders o ON od.order_id = o.order_id
WHERE o.order_date BETWEEN '2024-06-01' AND '2024-06-15'
  AND od.product_id IN (1,3,6);
--9--




SELECT
    CASE
        WHEN o.order_date < '2024-06-01' THEN 'Before Promotion'
        WHEN o.order_date BETWEEN '2024-06-01' AND '2024-06-15' THEN 'During Promotion'
        ELSE 'After Promotion'
    END AS promotion_period,
    SUM(od.quantity * od.unit_price) AS sales
FROM Order_Details od
JOIN Orders o ON od.order_id = o.order_id
WHERE od.product_id IN (1,3,6)
GROUP BY
    CASE
        WHEN o.order_date < '2024-06-01' THEN 'Before Promotion'
        WHEN o.order_date BETWEEN '2024-06-01' AND '2024-06-15' THEN 'During Promotion'
        ELSE 'After Promotion'
    END;


--10--
SELECT
    customer_id,
    COUNT(order_id) AS orders_count,
    CASE
        WHEN COUNT(order_id) < 15 THEN 'Low Activity'
        WHEN COUNT(order_id) BETWEEN 15 AND 20 THEN 'Medium Activity'
        ELSE 'High Activity'
    END AS customer_segment
FROM Orders
GROUP BY customer_id
ORDER BY orders_count DESC;

--11--
SELECT
    c.category_name,
    p.product_name,
    product_sales
FROM (
    SELECT
        p.product_id,
        p.category_id,
        SUM(od.quantity * od.unit_price) AS product_sales
    FROM Order_Details od
    JOIN Products p ON od.product_id = p.product_id
    GROUP BY p.product_id, p.category_id
) AS sales_per_product
JOIN Products p ON sales_per_product.product_id = p.product_id
JOIN Categories c ON p.category_id = c.category_id
WHERE product_sales = (
    SELECT MAX(sp2.product_sales)
    FROM (
        SELECT
            p2.product_id,
            p2.category_id,
            SUM(od2.quantity * od2.unit_price) AS product_sales
        FROM Order_Details od2
        JOIN Products p2 ON od2.product_id = p2.product_id
        GROUP BY p2.product_id, p2.category_id
    ) sp2
    WHERE sp2.category_id = sales_per_product.category_id
)
ORDER BY c.category_name;
 --12--

SELECT
    p.product_id,
    
    SUM(od.quantity) AS total_quantity_sold,
    SUM(od.quantity * od.unit_price) AS total_revenue
FROM Order_Details od
JOIN Products p
    ON od.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY
    product_id ASC;
