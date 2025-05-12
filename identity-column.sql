# Identity Column

-- values for a column will be automatically generated when new row is inserted
-- the column has to be non nullable 
	-- error: Could not create IDENTITY attribute on nullable column 'student_id', table 'student'.

create table student (

	student_id int identity(1, 1) primary key
	name nvarchar(50)
)

-- identity(1, 1) 
	--> identity seed: value from where to start 
	--> identity increment: by what value increment the next value

# you can add a PRIMARY KEY constraint to an existing column in SQL Server — as long as:
	-- The column contains unique and non-null values.
	-- There is no existing primary key on the table (a table can only have one)

alter table student 
add constraint PK_student_id primary key (student_id)

-- can a column be identity column without primary key? --> yes -- but duplicate keys will be present then
-- can identity column be reseed if data is still there to an already existing seed value --> yes, but the column should not be primary key 

-- even after seeding to 0, it will only pick the next available slot if column is a primary key

# To explicitly set a value for identity column

-- turn on identity insert - set identity_insert student on
-- when inserting query specify the column name - insert into student (student_id, name) values (1, 'k')

# To reset the identity column use 

DBCC CheckIdent('student', reseed, 0)

--------------------------------------------------------------------------------------------------------

create table student (

	student_id int identity(1, 1),
	name nvarchar(50)
)

insert into student values('k'), ('v'), ('r')

select * from student

set identity_insert student on

insert into student(student_id, name) values(1, 'k'), (2, 'v'), (3, 'r')

dbcc checkident('student', reseed, 0)

alter table student 
add constraint PK_student_id primary key (student_id)

--------------------------------------------------------------------------------------------------------

# To retrieve the last identity value that is generated use

scope_identity() - same session and same scope
@@identity - same session across any scope
ident_current('table_name') - specific table across any session and any scope

-- session - new connection to the sql server

-- most common way is to use scope_identity() function  