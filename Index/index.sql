# Indexes 

-- are used by queries to find data from tables quickly
-- are created on tables and views

-- if there is no index to help the query, then query engine checks every row in the table from start to end
-- this is called table scan
-- table scan is bad for performance

-- usually prefixed by ix followed by table name and column on which indexing is done

e.g: ix_employee_name

----------------------------------------------------------------------------------------------------

Index creation:

create index ix_employee_salary on employee (salary asc)

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

index_name							index_description										index_keys
ix_employee_salary					nonclustered located on PRIMARY							salary
PK__employee__C52E0BA8F25E91F5		clustered, unique, primary key located on PRIMARY		employee_id

----------------------------------------------------------------------------------------------------

# To delete or drop the index: specify the table name and index name

drop index employee.ix_employee_salary

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


