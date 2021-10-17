SELECT prod.ProductID, prod.Name, prod.Color, prod.StandardCost, prod.ListPrice, prod.Size, prod.Weight, 
sod.SalesOrderID, sod.OrderQty, sod.UnitPrice, sod.UnitPriceDiscount, sod.LineTotal, 
soh.SubTotal, soh.TaxAmt, soh.TotalDue 
FROM SalesLT.Product prod 
INNER JOIN SalesLT.SalesOrderDetail sod 
ON prod.ProductID = sod.ProductID 
INNER JOIN SalesLT.SalesOrderHeader soh 
ON soh.SalesOrderID = sod.SalesOrderID 
ORDER BY prod.ProductID, sod.SalesOrderID; 