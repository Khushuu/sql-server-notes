# Non clustered index

-- analogous to an index in a textbook
-- data stored in one place and index stored in another place

-- index will have pointers(row locator) to storage location of data (to actual data row in the table)
-- in the index itself the data is stored in ascending or descending order of the index key
-- which doesn't influence the storage of data in the table

-- since the non-clustered index is stored seperately from the actual data 
-- a table can have more than one non-clustered index

-- just like a book can have index by chapters at the beginning and
-- another index by common terms at the end 

# If your query requests a column not in the index, the database must:

-- Use the non-clustered index to find the matching rows.
-- Then "look back" (called a bookmark lookup or key lookup) into the table to fetch the rest of the columns.

e.g: 

-- if index is created on the name column of employee table
create nonclustered index ix_employee_name on employee (name);

-- This query only uses data in the non-clustered index. 
-- ✅ Fast — no need to look at the table
select name from employee where name = 'k' 

-- salary is not in the non-clustered index
-- the query usses the index to find matching name values
-- then does a lookup into the table to get salary 
select salary from employee where name = 'k' 

-- That lookup step is what makes non-clustered indexes slower in such cases.

# To avoid the lookup, you can include extra columns in a non-clustered index:

CREATE NONCLUSTERED INDEX IX_Employee_Name_Salary 
ON Employee(Name)
INCLUDE(Salary);

---------------------------------------------------------------------------------------------------------

# Creating non clustered index

create nonclustered index ix_employee_name on employee (name asc)

---------------------------------------------------------------------------------------------------------

# Drop index

drop index employee.ix_employee_name

---------------------------------------------------------------------------------------------------------

-- indexes on employee table

index_name						index_description									index_keys
ix_employee_name				nonclustered located on PRIMARY						name
ix_employee_salary				nonclustered located on PRIMARY						salary
PK__employee__C52E0BA8F25E91F5	clustered, unique, primary key located on PRIMARY	employee_id
