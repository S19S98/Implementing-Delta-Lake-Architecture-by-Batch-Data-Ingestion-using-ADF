SELECT cust.CustomerID, cust.FirstName + ' ' + cust.LastName AS [Name], cust.CompanyName, cust.EmailAddress, cust.PasswordSalt, cust.Phone, 
soh.SubTotal, soh.TaxAmt, soh.TotalDue, 
sod.SalesOrderID, sod.OrderQty, sod.UnitPrice, 
prod.ProductID, prod.Name, prod.Color, prod.ListPrice, prod.Size, prod.Weight, prod.StandardCost, 
ad.AddressID, ad.City, ad.CountryRegion, ad.StateProvince 
FROM SalesLT.Customer cust 
INNER JOIN SalesLT.SalesOrderHeader soh 
ON cust.CustomerID = soh.CustomerID 
INNER JOIN SalesLT.SalesOrderDetail sod 
ON sod.SalesOrderID = soh.SalesOrderID 
INNER JOIN SalesLT.Product prod 
ON prod.ProductID = sod.ProductID 
INNER JOIN SalesLT.CustomerAddress custad 
ON custad.CustomerID = cust.CustomerID 
INNER JOIN SalesLT.Address ad 
ON ad.AddressID = custad.AddressID 
ORDER BY prod.ProductID, cust.CustomerID, sod.SalesOrderID, ad.AddressID; 