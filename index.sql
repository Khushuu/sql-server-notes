# Indexes 

-- are used by queries to find data from tables quickly
-- are created on tables and views

-- if there is no index to help the query, then query engine checks every row in the table from start to end
-- this is called table scan
-- table scan is bad for performance

----------------------------------------------------------------------------------------------------

Index creation:

create index idx_employee_salary on employee (salary asc)

-- index stores salary of each employee in ascending order
-- salary of the employee is mapped to each row or row address 

----------------------------------------------------------------------------------------------------

query:

select * from employee where salary > 1000 and salary < 6000

-- sql server picks up the row address from the index 
-- and directly fetches the records from the table
-- rather than scanning each row in the table

-- this is called INDEX SEEK

----------------------------------------------------------------------------------------------------

# To get all indexes on a table use query

execute sp_helptext employee

----------------------------------------------------------------------------------------------------

# To delete or drop the index: specify the table name and index name

drop index employee.idx_employee_salary

----------------------------------------------------------------------------------------------------

# different types of indexes in SQL Server:

1. Clustered
2. Nonclustered
3. Unique
4. Filtered
5. XML
6. Full Text
7. Spatial
8. Columnstore
9. Index with included columns
10. Index on computed columns


