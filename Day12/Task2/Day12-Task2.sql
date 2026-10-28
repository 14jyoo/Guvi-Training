CREATE DATABASE sales_day11_analysis;

USE sales_day11_analysis;

CREATE TABLE sales (
    OrderID INT,
    OrderDate DATE,
    Product VARCHAR(100),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    City VARCHAR(100)
);

USE sales_day11_analysis;

SHOW TABLES;

DESCRIBE sales;

SELECT *
FROM sales;

SELECT COUNT(*) AS total_orders
FROM sales;

SELECT
    SUM(Quantity * UnitPrice) AS total_revenue
FROM sales;

SELECT
    OrderID,
    Product,
    Quantity,
    UnitPrice,
    Quantity * UnitPrice AS Revenue
FROM sales
ORDER BY Revenue DESC;

SELECT
    OrderID,
    Product,
    Quantity,
    UnitPrice,
    Quantity * UnitPrice AS Revenue
FROM sales
ORDER BY Revenue DESC
LIMIT 1;

SELECT
    Product,
    SUM(Quantity * UnitPrice) AS total_revenue
FROM sales
GROUP BY Product
ORDER BY total_revenue DESC;

SELECT
    City,
    SUM(Quantity * UnitPrice) AS total_revenue
FROM sales
GROUP BY City
ORDER BY total_revenue DESC;

SELECT
    Product,
    SUM(Quantity) AS total_quantity_sold
FROM sales
GROUP BY Product
ORDER BY total_quantity_sold DESC;

SELECT
    ROUND(AVG(UnitPrice), 2) AS average_unit_price
FROM sales;

SELECT *
FROM sales
WHERE OrderDate IS NULL;

SELECT
    City,
    SUM(Quantity * UnitPrice) AS total_revenue
FROM sales
GROUP BY City
HAVING SUM(Quantity * UnitPrice) > 100
ORDER BY total_revenue DESC;

SELECT
    Product,
    UnitPrice
FROM sales
WHERE UnitPrice = (
    SELECT MAX(UnitPrice)
    FROM sales
);
