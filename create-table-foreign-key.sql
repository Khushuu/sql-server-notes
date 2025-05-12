-- tables

-- query for adding a foreign key constraint to existing tables

-- generic query 

alter table [foreignKeyTable] add constraint foreignKeyTable_ForeignKeyColumn_FK foreign key (foreignKeyColumn)
references primaryKeyTable (primaryKeyColumn)

alter table billingInfo add constraint billingInfo_card_type_id_FK foreign key (card_type_id)
references cardType (card_type_id)


-- FOREIGN KEY 

-- used to enforce database integrity
-- foreign key in one table points to primary key in another table
-- foreign key constraint prevents invalid data from being inserted into foreign key column
-- the value inserted into foreign key column has to be present in the table it points to 


use play
go

create table gender (
	
	gender_id int primary key,
	gender nvarchar(20) not null
)


create table person (

	id int primary key,
	name nvarchar(50) not null,
	email nvarchar(50) not null,
	gender_id int,
	foreign key (gender_id) references gender(gender_id)
);
