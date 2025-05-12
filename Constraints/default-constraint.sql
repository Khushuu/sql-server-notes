Default constraints

-- a column can be specified using DEFAULT constraint
-- used to insert default value into a column
-- default value added to the new record if no other value is specified including NULL

-- use DF_table_name_column_name --> naming convention for default constraint

use play
go

create table gender (
	
	gender_id int primary key,
	gender nvarchar(20) not null
)


-- while creating table add default constraint

create table person (

	id int primary key,
	name nvarchar(50) not null,
	email nvarchar(50) not null,
	gender_id int,
	creation_date datetime not null default getdate() -- default constraint
	foreign key (gender_id) references gender(gender_id)
);

-- Altering existing column to add a default constraint:

Alter table [table_name]
add constraint [constraint_name]
default [default_value] for [existing_column_name]

alter table person
add constraint DF_person_gender_id 
default 3 for gender_id

-- Adding a new column with default value to an existing table

Alter table [table_name]
add [column_name] [datatype] [null | not null]
constraint [constraint_name] default [default_value]

alter table person
add change_date DATETIME not null 
constraint DF_person_change_date default getdate()

-- dropping a constraint

alter table [table_name]
drop constraint [constraint_name]

alter table person
drop constraint default_gender


