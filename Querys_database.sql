-- 1. Select all the details of products priced over 100
SELECT *
FROM SalesLT.Product
WHERE ListPrice > 100;


-- 2. Shows products that belong to category co ID 18 and have a weight of more than 1000
SELECT p.Name, p.Weight
FROM SalesLT.Product p
JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID
WHERE pc.ProductCategoryID = 18 AND p.Weight > 1000;

-- 3. Select the names and prices of the products priced between 50 and 300
SELECT Name, ListPrice
FROM SalesLT.Product
WHERE ListPrice BETWEEN 50 AND 300;

-- 4. Shows how many products are in each category
SELECT pc.Name AS Category, COUNT(p.ProductID) AS NumberOfProducts
FROM SalesLT.Product p
JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name;

-- 5. Get the total amount of sales per customer
SELECT c.CustomerID, c.CompanyName, SUM(od.LineTotal) AS TotalSales
FROM SalesLT.Customer AS c
JOIN SalesLT.SalesOrderHeader AS soh ON c.CustomerID = soh.CustomerID
JOIN SalesLT.SalesOrderDetail AS od ON soh.SalesOrderID = od.SalesOrderID
GROUP BY c.CustomerID, c.CompanyName
ORDER BY TotalSales DESC;

-- 6. Displays customers who have purchased more than 10 products in total.
SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(*) AS TotalProductsPurchased
FROM SalesLT.Customer AS c
JOIN SalesLT.SalesOrderHeader AS soh ON c.CustomerID = soh.CustomerID
JOIN SalesLT.SalesOrderDetail AS sod ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING COUNT(*) > 10;

-- 7. Displays the name of the products together with the name of the category they belong to
SELECT p.Name AS ProductName, pc.Name AS CategoryName
FROM SalesLT.Product AS p
JOIN SalesLT.ProductCategory AS pc ON p.ProductCategoryID = pc.ProductCategoryID;

-- 8. Displays product names and dates of orders in which they have been sold
SELECT P.Name, O.OrderDate
FROM SalesLT.Product AS P
JOIN SalesLT.SalesOrderDetail AS D ON P.ProductID = D.ProductID
JOIN SalesLT.SalesOrderHeader AS O ON D.SalesOrderID = O.SalesOrderID;

-- 9. Displays product names and the names of customers who have purchased those products
SELECT p.Name AS ProductName, c.FirstName + ' ' + c.LastName AS CustomerName
FROM SalesLT.Product AS p
JOIN SalesLT.SalesOrderDetail AS sod ON p.ProductID = sod.ProductID
JOIN SalesLT.SalesOrderHeader AS soh ON sod.SalesOrderID = soh.SalesOrderID
JOIN SalesLT.Customer AS c ON soh.CustomerID = c.CustomerID;

-- 10. Find the customers who have spent more than 1000, and how much they have spent
SELECT c.CustomerID, c.FirstName, c.LastName, SUM(od.LineTotal) AS TotalSpent
FROM SalesLT.Customer AS c
JOIN SalesLT.SalesOrderHeader AS soh ON c.CustomerID = soh.CustomerID
JOIN SalesLT.SalesOrderDetail AS od ON soh.SalesOrderID = od.SalesOrderID
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING SUM(od.LineTotal) > 1000;