use ecommerce;

INSERT INTO Customers (Name, Email, Address) VALUES
('Alice Mathew', 'alice@example.com', 'Trivandrum, Kerala'),
('Brian Dsouza', 'brian@example.com', 'Mumbai, Maharashtra'),
('Catherine Thomas', 'catherine@example.com', 'Chennai, Tamil Nadu'),
('David Raj', 'david@example.com', 'Hyderabad, Telangana'),
('Emily Sharma', 'emily@example.com', 'Delhi, India'),
('Farhan Sheikh', 'farhan@example.com', 'Lucknow, UP'),
('Gita Nair', 'gita@example.com', 'Kochi, Kerala'),
('Harsh Kapoor', 'harsh@example.com', 'Bangalore, Karnataka');

select * from customers;

INSERT INTO Products (Name, Description, Price) VALUES
('Laptop', '14-inch ultrabook with 8GB RAM', 55000.00),
('Smartphone', '5G Android smartphone with 128GB storage', 22000.00),
('Headphones', 'Wireless over-ear headphones', 3500.00),
('Gaming Mouse', 'RGB wired mouse with 6 buttons', 1200.00),
('Backpack', 'Water-resistant laptop backpack', 1800.00),
('Smartwatch', 'Fitness tracker with heart rate sensor', 5000.00),
('Bluetooth Speaker', 'Portable speaker with deep bass', 2700.00),
('Webcam', 'Full HD USB webcam with mic', 2500.00);

INSERT INTO Orders (CustomerID, OrderDate) VALUES
(1, '2024-01-10'),
(2, '2024-01-12'),
(3, '2024-01-15'),
(4, '2024-01-18'),
(5, '2024-02-01'),
(6, '2024-02-05'),
(7, '2024-02-10'),
(8, '2024-02-12');

INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 3),
(5, 5, 2),
(6, 6, 1),
(7, 7, 2),
(8, 8, 1);

SELECT Name, Email, Address, COUNT(*) as count
FROM Customers
GROUP BY Name, Email, Address
HAVING COUNT(*) > 1;

DELETE c1 FROM Customers c1
JOIN Customers c2 
ON c1.Name = c2.Name 
   AND c1.Email = c2.Email 
   AND c1.Address = c2.Address 
   AND c1.CustomerID > c2.CustomerID;
   
   use ecommerce;
   DELETE FROM Customers 
WHERE CustomerID NOT IN (
    SELECT * FROM (
        SELECT MIN(CustomerID)
        FROM Customers
        GROUP BY Name, Email, Address
    ) as keep_ids
);

select * from customers;

SELECT * FROM customers
WHERE name LIKE 'A%';

SELECT customerid, COUNT(orderid) AS total_orders
FROM orders
GROUP BY customerid
ORDER BY total_orders DESC;

SELECT c.name, o.orderid, o.orderdate
FROM customers c
JOIN orders o ON c.customerid = o.customerid;

SELECT c.name, o.orderid
FROM customers c
LEFT JOIN orders o ON c.customerid = o.customerid;

SELECT 
    orderdetails.orderId,
    orderdetails.quantity,
    products.productId,
    products.Name,
    products.price
FROM orderdetails
RIGHT JOIN products 
ON orderdetails.productId = products.productId;

SELECT name FROM customers
WHERE customerid IN (
  SELECT customerid FROM orderdetails WHERE quantity > 1
);

SELECT AVG(price) AS average_price
FROM products;

Select SUM(Price) AS sum_price FROM products;

CREATE INDEX idx_customer_id ON orders(customerid);

CREATE view customer_orders AS select c.name, o.orderid, o.orderdate from customers c JOIN orders o ON c.CustomerID=o.customerid;

SELECT * from customer_orders;