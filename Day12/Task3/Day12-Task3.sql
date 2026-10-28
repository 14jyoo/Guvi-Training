CREATE DATABASE retail_sales_analysis; 
 
USE retail_sales_analysis; 


CREATE TABLE retail_sales ( 
    OrderID VARCHAR(20), 
    OrderDate VARCHAR(30), 
    Product VARCHAR(100), 
    Category VARCHAR(100), 
    Quantity VARCHAR(30), 
    UnitPrice VARCHAR(30), 
    DiscountPercent VARCHAR(30), 
    City VARCHAR(100), 
    SalesChannel VARCHAR(100), 
    PaymentMethod VARCHAR(100) 
)

SELECT * 
FROM retail_sales; 


 

SELECT COUNT(*) AS total_orders 
FROM retail_sales; 

SELECT 
    SUM( 
        CAST(Quantity AS DECIMAL(10,2)) * 
        CAST(UnitPrice AS DECIMAL(10,2)) * 
        (1 - CAST(DiscountPercent AS DECIMAL(10,2)) / 100) 
    ) AS total_sales_after_discount 
FROM retail_sales 
WHERE Quantity REGEXP '^[0-9]+(\\.[0-9]+)?$' 
  AND UnitPrice REGEXP '^[0-9]+(\\.[0-9]+)?$' 
  AND DiscountPercent REGEXP '^[0-9]+(\\.[0-9]+)?$' 
  AND CAST(DiscountPercent AS DECIMAL(10,2)) BETWEEN 0 AND 100; 
  
  
  SELECT 
    OrderID, 
    Product, 
    Quantity, 
    UnitPrice, 
    DiscountPercent, 
    CAST(Quantity AS DECIMAL(10,2)) * 
    CAST(UnitPrice AS DECIMAL(10,2)) * 
    (1 - CAST(DiscountPercent AS DECIMAL(10,2)) / 100) AS NetSales 
FROM retail_sales 
WHERE Quantity REGEXP '^[0-9]+(\\.[0-9]+)?$' 
  AND UnitPrice REGEXP '^[0-9]+(\\.[0-9]+)?$' 
  AND DiscountPercent REGEXP '^[0-9]+(\\.[0-9]+)?$' 
  AND CAST(DiscountPercent AS DECIMAL(10,2)) BETWEEN 0 AND 100 
ORDER BY NetSales DESC; 

SELECT 
    OrderID, 
    Product, 
    CAST(Quantity AS DECIMAL(10,2)) * 
    CAST(UnitPrice AS DECIMAL(10,2)) * 
    (1 - CAST(DiscountPercent AS DECIMAL(10,2)) / 100) AS NetSales 
FROM retail_sales 
WHERE Quantity REGEXP '^[0-9]+(\\.[0-9]+)?$' 
  AND UnitPrice REGEXP '^[0-9]+(\\.[0-9]+)?$' 
  AND DiscountPercent REGEXP '^[0-9]+(\\.[0-9]+)?$' 
  AND CAST(DiscountPercent AS DECIMAL(10,2)) BETWEEN 0 AND 100 
ORDER BY NetSales DESC 
LIMIT 1; 

SELECT 
    Product, 
    SUM( 
        CAST(Quantity AS DECIMAL(10,2)) * 
        CAST(UnitPrice AS DECIMAL(10,2)) * 
        (1 - CAST(DiscountPercent AS DECIMAL(10,2)) / 100) 
    ) AS total_net_sales 
FROM retail_sales 
WHERE Quantity REGEXP '^[0-9]+(\\.[0-9]+)?$' 
  AND UnitPrice REGEXP '^[0-9]+(\\.[0-9]+)?$' 
  AND DiscountPercent REGEXP '^[0-9]+(\\.[0-9]+)?$' 
  AND CAST(DiscountPercent AS DECIMAL(10,2)) BETWEEN 0 AND 100 
GROUP BY Product 
ORDER BY total_net_sales DESC; 

SELECT 
    City, 
    SUM( 
        CAST(Quantity AS DECIMAL(10,2)) * 
        CAST(UnitPrice AS DECIMAL(10,2)) * 
        (1 - CAST(DiscountPercent AS DECIMAL(10,2)) / 100) 
    ) AS total_net_sales 
FROM retail_sales 
WHERE Quantity REGEXP '^[0-9]+(\\.[0-9]+)?$' 
  AND UnitPrice REGEXP '^[0-9]+(\\.[0-9]+)?$' 
  AND DiscountPercent REGEXP '^[0-9]+(\\.[0-9]+)?$' 
  AND CAST(DiscountPercent AS DECIMAL(10,2)) BETWEEN 0 AND 100 
GROUP BY City 
ORDER BY total_net_sales DESC; 

SELECT Product, UnitPrice 
FROM retail_sales 
WHERE UnitPrice REGEXP '^[0-9]+(\\.[0-9]+)?$' 
  AND CAST(UnitPrice AS DECIMAL(10,2)) > 5000 
ORDER BY CAST(UnitPrice AS DECIMAL(10,2)) DESC; 