# Unique and non-unique indexes

# Unique index

-- used to enforce uniqueness of key values in the index
-- the UNIQUE index is used to enforce the uniqueness of values and primary key constraint
-- UNIQUENESS is a property of an Index, and both CLUSTERED and NON-CLUSTERED indexes can be UNIQUE

---------------------------------------------------------------------------------------------------------

e.g:

CREATE TABLE [dbo].[employee](
	[employee_id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[city] [nvarchar](50) NULL,
	[salary] [int] NOT NULL
)

-- since employee_id is the primary key for the table
-- a UNIQUE CLUSTERED INDEX gets created on the employee_id column, with employee_id as the index key

---------------------------------------------------------------------------------------------------------

-- verify by running this query

execute sp_helpindex employee

index_name			index_description					index_keys
PK__employee__C52E0BA8F25E91F5	clustered, unique, primary key located on PRIMARY	employee_id

---------------------------------------------------------------------------------------------------------

# since we have unique clustered index on employee_id - attempt to add duplicate keys will throw error

Violation of PRIMARY KEY constraint 'PK__employee__C52E0BA8F25E91F5'. Cannot insert duplicate key in object 'dbo.employee'. The duplicate key value is (7)

---------------------------------------------------------------------------------------------------------

# attempt to drop the unique clustered index also throws error

-- error
An explicit DROP INDEX is not allowed on index 'employee.PK__employee__C52E0BA8F25E91F5'. It is being used for PRIMARY KEY constraint enforcement.

drop index employee.PK__employee__C52E0BA8F25E91F5

---------------------------------------------------------------------------------------------------------

# SQL server internally, uses the UNIQUE index to enforce the uniqueness of values and primary key.

---------------------------------------------------------------------------------------------------------

# To delete UNIQUE CLUSTERED INDEX
-- Right click on the index in object explorer
-- and select DELETE and finally, click OK
-- Along with the UNIQUE index, the primary key constraint is also deleted

---------------------------------------------------------------------------------------------------------

# Creating UNIQUE NON CLUSTERED index on name and salary column

create unique nonclustered index uix_employee_name_salary on employee (name, salary)

-- this unique nonclustered index ensures that no 2 entries in the index has the same name and salary

---------------------------------------------------------------------------------------------------------

# there is no major difference between a unique constraint and a unique index

-- when u add a unique constraint a unique index gets created behind the scenes
-- a UNIQUE index can be created explicitly, using CREATE INDEX statement or indirectly using a UNIQUE constraint

---------------------------------------------------------------------------------------------------------

# NOTE:

-- By default, a PRIMARY KEY constraint, creates a unique clustered index
-- where as a UNIQUE constraint creates a unique nonclustered index
-- A UNIQUE constraint or a UNIQUE index cannot be created on an existing table, if the table contains duplicate values in the key columns
-- to solve this,remove the key columns from the index definition or delete or update the duplicate values

---------------------------------------------------------------------------------------------------------

# IGNORE_DUP_KEY option 

-- By default, duplicate values are not allowed on key columns with unique index or constraint
-- if u try to insert 10 rows out of which 5 rows contain duplicates - all 10 rows are rejected
-- to reject just 5 duplicate rows and accept rest 5 non-duplicate rows use: IGNORE_DUP_KEY option

-- create a unique nonclustered index
create unique index ix_employee_salary on employee (salary) with ignore_dup_key

-- on trying to insert duplicate value

message:
Duplicate key was ignored.

