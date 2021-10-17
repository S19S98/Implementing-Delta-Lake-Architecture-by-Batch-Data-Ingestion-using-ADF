SELECT cust.CustomerID, cust.FirstName + ' ' + cust.LastName AS [NAME], cust.SalesPerson ,cust.CompanyName, cust.EmailAddress, cust.Phone, cust.PasswordSalt, 
ad.AddressID, ad.StateProvince, ad.CountryRegion, ad.City, ad.PostalCode, 
custad.AddressType 
FROM SalesLT.Address ad 
INNER JOIN SalesLT.CustomerAddress custad 
ON ad.AddressID = custad.AddressID 
INNER JOIN SalesLT.Customer cust 
ON cust.CustomerID = custad.CustomerID 
ORDER BY cust.CustomerID, ad.AddressID; 
