# Indexed views

-- a standard or Non-indexed view, is just a stored SQL query
-- when we retrieve data from the view, the data is actually retrieved from the underlying base tables
-- a view is just a virtual table it does not store any data, by default

-- when you create an index, on a view, the view gets materialized
-- this means the view is not capable of storing data 
-- in SQL server, we call them Indexed views and in Oracle, Materialized views

--------------------------------------------------------------------------------------------------------------

# Rules to follow to create an index on a view

-- view should be created with SchemaBinding option

-- If an Aggregate function in the SELECT LIST, references an expression
-- and if there is a possibility for that expression to become NULL
-- then, a replacement value should be specified
-- In this example, we are using, ISNULL() function, to replace NULL values with ZERO

-- If GROUP BY is specified, the view select list must contain a COUNT_BIG(*) expression

-- The base tables in the view, should be referenced with 2 part name
-- In this example, tblProduct and tblProductSales are referenced 
-- using dbo.tblProduct and dbo.tblProductSales respectively

--------------------------------------------------------------------------------------------------------------

# creating indexed view

Create view vWTotalSalesByProduct
with SchemaBinding
as
Select Name, 
SUM(ISNULL((QuantitySold * UnitPrice), 0)) as TotalSales, 
COUNT_BIG(*) as TotalTransactions
from dbo.tblProductSales
join dbo.tblProduct
on dbo.tblProduct.ProductId = dbo.tblProductSales.ProductId
group by Name

# create an index on the view

Create Unique Clustered Index UIX_vWTotalSalesByProduct_Name
on vWTotalSalesByProduct(Name)

--------------------------------------------------------------------------------------------------------------

# Since, we now have an index on the view, the view gets materialized
-- The data is stored in the view
-- the data is retrurned from the view itself, rather than retrieving data from the underlying base tables

--------------------------------------------------------------------------------------------------------------

# Usability:

-- Indexed views, can significantly improve the performance of queries that involves JOINS and Aggeregations
-- The cost of maintaining an indexed view is much higher than the cost of maintaining a table index

-- Indexed views are ideal for scenarios, where the underlying data is not frequently changed

-- Indexed views are more often used in OLAP systems
-- because the data is mainly used for reporting and analysis purposes

-- Indexed views, may not be suitable for OLTP systems, as the data is frequently addedd and changed

