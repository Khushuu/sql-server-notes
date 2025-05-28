# Clustered Index:

-- determines the physical storage order of data in a table
-- for this reason a table can have only one clustered index 

# Primary key constraint automatically creates clustered indexes if
	-- no clustered index already exists on the table	
	-- and a nonclustered index [keyword] is not specified when PRIMARY KEY constraint is created

--------------------------------------------------------------------------------------------------------

CREATE TABLE [dbo].[employee](
	[employee_id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[city] [nvarchar](50) NULL,
	[salary] [int] NOT NULL
)

-- Insert query: values for id column are not in sequential order 

insert into employee(employee_id, name, city, salary) values (7, 'r', 'madrid', 3000)
insert into employee(employee_id, name, city, salary) values (5, 'tt', 'dubai', 6000)

select * from employee

--------------------------------------------------------------------------------------------------------

# Rows inserted in order in the table

-- inspite of inserting the rows in a random order
-- all the rows in the table are arranged in ascending order based on employee_id column
-- clustered index determines physical order of data in a table
-- we have clustered index on employee_id column

--------------------------------------------------------------------------------------------------------

# A table can have only one clustered index

-- a clustered index dictates the physical storage order of data in the table
-- if u create another clustered index with some other column the data in table has to be rearranged
-- which is not allowed 

-- query: to create second clustered index along with employee_id on name

create clustered index ix_employee_name on employee (name asc)

-- error:

Cannot create more than one clustered index on table 'employee'. Drop the existing clustered index 'PK__employee__C52E0BA8F25E91F5' before creating another.

--------------------------------------------------------------------------------------------------------

# a clustered index can contain multiple columns (a composite index)

-- Create composite clustered index on name and salary

create clustered index ix_employee_name_salary on employee (name asc, salary desc);

-- data should be arranged first by ascending order of name
-- then by descending order of salary

--------------------------------------------------------------------------------------------------------

# Drop index

-- get the error as the clustered index is on primary key constraint 
-- error: An explicit DROP INDEX is not allowed on index 'employee.PK__employee__C52E0BA8F25E91F5'. It is being used for PRIMARY KEY constraint enforcement.

drop index employee.PK__employee__C52E0BA8F25E91F5

---------------------------------------------------------------------------------------------------------

-- indexes on employee table

index_name						index_description									index_keys
ix_employee_name				nonclustered located on PRIMARY						name
ix_employee_salary				nonclustered located on PRIMARY						salary
PK__employee__C52E0BA8F25E91F5	clustered, unique, primary key located on PRIMARY	employee_id









