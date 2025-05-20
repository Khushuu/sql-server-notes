# Temporary tables in SQL Server

-- created in the TempDB
-- automatically deleted when no longer in use
-- temp tables are created same way as permanent tables just prefix table name with # or ##
-- temp table and permanent table of same name can not be create at once 
-- use the same drop command to delete temp table

------------------------------------------------------------------------------------------------------------------

# Different types of temporary tables

# Local Temporary tables

-- name prefixed with 1 pound(#) symbol
-- to check if the local temporary table is create use below query:

Select name from tempdb..sysobjects where name like '#student%' 
-- #student_________________________________________________________000000000007

-- the name of the temp table is suffixed with lots of underscores and a random number

-- only available for the connection that has created the table
-- if another query window is opened and select query is executed u get the error: Invalid object name '#student'.
-- multiple users across multiple connections can have same local temp table name 

-- when the connection that has created the table is closed the local temp table is deleted
-- to explicitly drop the table use drop query

-- different connections can create local temp table with same name
-- the random number added at the end of local temp tables created by different connections will be different

------------------------------------------------------------------------------------------------------------------

create table #student(id int, name varchar(20))

insert into #student values (1, 'k'), (2, 's')

select * from #student

drop table #student

------------------------------------------------------------------------------------------------------------------

-- local temp table is created inside the stored procedure - gets dropped after completion of SP execution

create procedure temptable 
as 
begin
	create table #student(id int, name varchar(20))
	insert into #student values (1, 'k'), (2, 's')
	select * from #student
end

------------------------------------------------------------------------------------------------------------------

# Global Temporary tables

-- prefix the name of the table with 2 pound (##) symbols

create table ##manager(id int, name varchar(20))
insert into ##manager values (1, 'k'), (2, 's')
select * from ##manager

-- visible to all connections of the sql server 
-- destroyed when the last connection referencing the table is closed
-- no random number or underscore is suffixed at the end of global temp table
-- name of global temp table has to be unique - different connections can not have same name like local temp tables 




