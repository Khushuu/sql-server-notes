# UNION AND UNION ALL 

-- both are used to combine the result-set of two or more SELECT queries 
-- only works if the number, data types and the order of columns in the select statement is the same

# Difference between UNION and UNION ALL

-- union removes duplicate rows but UNION ALL does not
-- union returns data in sorted order - does distinct sort to remove duplicates which makes it slower than UNION ALL

NOTE: estimated query execution plan: CTRL + L

create table primaryStudent (
	id int primary key identity(1, 1),
	name nvarchar(20) not null,
	class int not null
)

create table secondaryStudent (
	id int primary key identity(1, 1),
	name nvarchar(20) not null,
	class int not null
)

insert into primaryStudent values('drulo', 1), ('sid', 2)
insert into secondaryStudent values('harry', 8), ('sid', 2), ('ashlyn', 7)


-- UNION - duplicate data sid is not returned 
select * from primaryStudent
union
select * from secondaryStudent


-- UNION ALL - returns data as it is without sorting
select * from primaryStudent
union all
select * from secondaryStudent


-- u can use * or mention all columns in the two select statements - it works the same 
select * from primaryStudent
union all
select id, name, class from secondaryStudent


-- different order works until the columns have same datatypes
select id, class from primaryStudent
union all
select class, id from secondaryStudent 


-- different datatypes wouldn't work
-- error: Conversion failed when converting the nvarchar value 'harry' to data type int.
select id, class from primaryStudent
union all
select id, name from secondaryStudent 


-- error since the number of columns is different
-- error: All queries combined using a UNION, INTERSECT or EXCEPT operator must have an equal number of expressions in their target lists.
select id, class from primaryStudent
union all
select id, name, class from secondaryStudent 


-- order by in UNION and UNION ALL should be added to the last select statement not previous ones else u get error
select* from primaryStudent
union 
select * from secondaryStudent order by id


-- order by in UNION and UNION ALL should be added to the last select statement not previous ones else u get error
select* from primaryStudent
union all
select * from secondaryStudent order by name

--------------------------------------------------------------------------------------------------------

# Difference between UNION and JOIN

-- union combines rows from 2 or more tables
-- JOINS combines columns from 2 or more tables 